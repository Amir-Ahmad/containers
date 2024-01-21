#!/usr/bin/env bash
set -euo pipefail

log(){
    local timestamp
    timestamp=$(date +"%Y-%m-%d %T")
    echo "[${timestamp}] $*"
}

SSH_USER_NAME="${SSH_USER_NAME:?SSH_USER_NAME must be provided}"
SSH_USER_UID="${SSH_USER_UID:?SSH_USER_UID must be provided}"
SSH_USER_GID="${SSH_USER_GID:?SSH_USER_GID must be provided}"
SSH_USER_PUBLIC_KEY="${SSH_USER_PUBLIC_KEY:?SSH_USER_PUBLIC_KEY must be provided}"
SSH_USER_ENABLE_SUDO="${SSH_USER_ENABLE_SUDO:-false}"

if [ ! -f "/config/ssh_host_ed25519_key" ]; then
  log "Generating host key as it wasn't found at /config/ssh_host_ed25519_key"
  log "It's recommended that you provide this"
  ssh-keygen -N '' -t ed25519 -f "/config/ssh_host_ed25519_key"
fi

chmod 600 "/config/ssh_host_ed25519_key" || true

home="/${SSH_USER_NAME}"

addgroup "${SSH_USER_NAME}" --gid "${SSH_USER_GID}"

adduser "${SSH_USER_NAME}" --gid "${SSH_USER_GID}" --uid "${SSH_USER_UID}" --disabled-password --home "${home}"

mkdir -p "${home}/.ssh"

echo "${SSH_USER_PUBLIC_KEY}" >> "${home}/.ssh/authorized_keys"

chown -R "${SSH_USER_NAME}:${SSH_USER_NAME}" "${home}" || true

if [[ "${SSH_USER_ENABLE_SUDO}" == "true" ]]; then
  log "enabling sudo for ${SSH_USER_NAME}"
  echo "${SSH_USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> "/etc/sudoers.d/${SSH_USER_NAME}"
fi

exec /usr/sbin/sshd -D -e

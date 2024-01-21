# openssh

Locked down and minimal image for running openssh-server. Each container should be for just one user.

Configuration is via environment variables:

```
SSH_USER_NAME="dummyuser"
SSH_USER_UID="1000"
SSH_USER_GID="1000"
SSH_USER_PUBLIC_KEY="ssh-ed25519 A..."

# optionally allow sudo to user
SSH_USER_ENABLE_SUDO="true"
```

This works with public key authentication only (no passwords), and only ed25519 keys (no RSA).

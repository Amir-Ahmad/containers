# yamtrack

[Yamtrack](https://github.com/FuzzyGrim/Yamtrack) is a self-hosted media tracker for movies, TV shows, and games. The official Docker image uses supervisord to manage multiple processes, which is an anti-pattern.

My yamtrack image is based on [wolfi](https://github.com/wolfi-dev), and follows best practices with a minimal runtime image that runs as a non-root user.

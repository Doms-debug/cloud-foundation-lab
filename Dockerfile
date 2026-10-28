FROM scratch
# Multi-stage Dockerfile, non-root user, exec form PID 1 (Week 0.1)
#
# TODO:
# 1. Builder stage: install dependencies and build the package/virtualenv (e.g., using uv)
# 2. Runtime stage: minimal base image (e.g., python:3.12-slim / distroless)
# 3. Create and switch to a non-root user (USER)
# 4. Run the application using exec form (ENTRYPOINT ["..."]) so it runs as PID 1 and receives SIGTERM

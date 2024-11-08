# syntax=docker/dockerfile:1
FROM caddy:latest

# Maintainer information
LABEL maintainer="akshaykrjain.github.io"

# Create custom HTML content
RUN echo "<html><head><title>Hello There!</title></head><body><h1>Hello from a great Docker-based app :)</h1></body></html>" > /usr/share/caddy/index.html

# Expose port 80 (HTTP) and 443 (HTTPS)
EXPOSE 80 443
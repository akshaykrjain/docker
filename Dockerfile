# syntax=docker/dockerfile:1

# Use the official Go 1.23.1 image as a base to build Caddy with the latest Go version
FROM golang:1.23.1-alpine as builder

# Set the working directory
WORKDIR /go/src/github.com/caddyserver/caddy

# Clone the Caddy repository
RUN git clone https://github.com/caddyserver/caddy.git .

# Build the Caddy binary (uses the latest Go and stdlib)
RUN go build -o /usr/local/bin/caddy

# Now use the Caddy base image (no need to pull latest if we’re building from scratch)
FROM caddy:latest

# Copy the compiled binary from the builder image
COPY --from=builder /usr/local/bin/caddy /usr/local/bin/caddy

# Maintainer information
LABEL maintainer="akshaykrjain.github.io"

# Create custom HTML content
RUN echo "<html><head><title>Hello There!</title></head><body><h1>Hello from a great Docker-based app :)</h1></body></html>" > /usr/share/caddy/index.html

# Expose port 80 (HTTP) and 443 (HTTPS)
EXPOSE 80 443
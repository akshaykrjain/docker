# syntax=docker/dockerfile:1

# Use the official Go 1.19.3 image as a builder stage
FROM golang:1.19.3-alpine AS builder

# Install Git
RUN apk add --no-cache git

# Set the working directory
WORKDIR /go/src/github.com/caddyserver/caddy

# Clone the Caddy repository
RUN git clone https://github.com/caddyserver/caddy.git .

# Build the Caddy binary (uses the latest Go and stdlib)
RUN go build -o /usr/local/bin/caddy ./cmd/caddy

# Use the official Caddy image as the final stage
FROM caddy:latest

# Copy the compiled binary from the builder image
COPY --from=builder /usr/local/bin/caddy /usr/local/bin/caddy

# Maintainer information
LABEL maintainer="akshaykrjain.github.io"

# Create custom HTML content
RUN echo "<html><head><title>Hello There!</title></head><body><h1>Hello from a great Docker-based Caddy app :)</h1></body></html>" > /usr/share/caddy/index.html

# Expose port 80 (HTTP) and 443 (HTTPS)
EXPOSE 80 443

# Start Caddy
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
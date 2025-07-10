FROM alpine:latest

# Install build tools
RUN apk add --no-cache gcc musl-dev

# Create app directory
WORKDIR /app

# Copy and build C file
COPY src/main.c .

RUN gcc -o writer main.c

# Mount point for volume
VOLUME ["/app"]

# Set execution entrypoint
CMD ["./writer"]


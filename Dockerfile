# Stage 1: Build
FROM alpine as builder
RUN apk add --no-cache gcc musl-dev
WORKDIR /app
COPY src/main.c .
RUN gcc -o writer main.c

# Stage 2: Minimal Runtime
FROM scratch
COPY --from=builder /app/writer /writer
ENTRYPOINT ["/writer"]


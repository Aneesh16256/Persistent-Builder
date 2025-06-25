# ------------ Stage 1: Build ------------
FROM alpine AS builder

WORKDIR /build

# Simulate a build process (could be a compiled binary, generated static site, etc.)
RUN echo "<html><body><h1>Hello from Multi-Stage Dockerfile!</h1></body></html>" > index.html

# ------------ Stage 2: Production ------------
FROM nginx:alpine

# Copy built site to NGINX html directory
COPY --from=builder /build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

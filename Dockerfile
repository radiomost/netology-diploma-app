# Use lightweight alpine-based nginx image to save resources
FROM nginx:alpine

# Remove default nginx static assets to avoid conflicts
RUN rm -rf /usr/share/nginx/html/*

# Copy custom static content and configuration
COPY index.html /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for incoming HTTP traffic
EXPOSE 80

# Run nginx in the foreground (best practice for Docker)
CMD ["nginx", "-g", "daemon off;"]
# frontend/Dockerfile
# Stage 1: build Flutter web
FROM cirrusci/flutter:stable AS builder

WORKDIR /app

# Copy pubspec and assets first for caching
COPY frontend/pubspec.* /app/
# If you use packages with native plugins you may need extra build steps.

# Copy all frontend sources
COPY frontend/ /app/

# Enable web build
RUN rm -rf $FLUTTER_HOME

RUN flutter channel stable && flutter upgrade
RUN flutter pub get
RUN flutter build web --web-renderer html --release

# Stage 2: serve with Nginx
FROM nginx:1.23-alpine

# Remove default site
RUN rm -rf /usr/share/nginx/html/*

# Copy compiled web app
COPY --from=builder /app/build/web /usr/share/nginx/html

# Custom nginx conf (optional)
COPY frontend/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


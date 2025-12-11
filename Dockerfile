# Stage 1: Build APK
FROM ghcr.io/cirruslabs/flutter:latest AS builder

WORKDIR /app

# Cache Gradle dependencies
ENV GRADLE_USER_HOME=/app/.gradle

# Copy pubspec files first for caching
COPY pubspec.* ./

# Get dependencies
RUN flutter pub get

# Copy rest of project
COPY . .

# Pre-cache Flutter artifacts
RUN flutter precache

# Build release APK
RUN flutter build apk --release

# Stage 2: Minimal image with APK only
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/build/app/outputs/flutter-apk/app-release.apk .
CMD ["echo", "APK is available at /app/app-release.apk"]
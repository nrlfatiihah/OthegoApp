# Stage 1: Build APK
FROM ghcr.io/cirruslabs/flutter:3.39.0-0.2.pre AS builder

# Create non-root user
RUN useradd -m flutteruser

# Make Flutter SDK and Android SDK writable by flutteruser
RUN chown -R flutteruser:flutteruser /sdks/flutter /opt/android-sdk-linux

# Switch to non-root user
USER flutteruser
WORKDIR /app

# Cache Gradle dependencies
ENV GRADLE_USER_HOME=/app/.gradle

# Tell Git that Flutter SDK directory is safe
RUN git config --global --add safe.directory /sdks/flutter

# Copy pubspec files first for dependency caching
COPY --chown=flutteruser:flutteruser pubspec.* ./

# Get dependencies
RUN flutter pub get

# Copy the rest of the project
COPY --chown=flutteruser:flutteruser . .

# Remove local.properties to avoid Windows paths
RUN rm -f android/local.properties

# Pre-cache Flutter artifacts
RUN flutter precache

# Clean previous builds
RUN flutter clean

# Build release APK
RUN flutter build apk --release

# Stage 2: Minimal image with APK only
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/build/app/outputs/flutter-apk/app-release.apk .
CMD ["echo", "APK is available at /app/app-release.apk"]
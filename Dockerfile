# Use official Flutter SDK image
FROM cirrusci/flutter:3.8.0-10.1.pre AS builder

# Set working directory
WORKDIR /app

# Copy pubspec files first for caching dependencies
COPY pubspec.* ./

# Get dependencies
RUN flutter pub get

# Copy the rest of the project
COPY . .

# Pre-cache Flutter artifacts (optional)
RUN flutter precache

# Build Android APK (release)
RUN flutter build apk --release

# Expose build output as a volume
VOLUME ["/app/build/app/outputs/flutter-apk"]

# Default command (prints location of APK)
CMD ["echo", "APK built at build/app/outputs/flutter-apk/app-release.apk"]
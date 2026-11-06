# FOODLINK

Offline-first campus food waste management app starter.

## Build an Android APK using GitHub

1. Create a new GitHub repository named `foodlink`.
2. Upload the contents of this folder to the repository (not the outer ZIP folder).
3. Open the repository's **Actions** tab.
4. Select **Build FOODLINK Android APK**.
5. Click **Run workflow** (or push to the `main` branch).
6. When the workflow finishes, open its run and download the `foodlink-android-apk` artifact.
7. Extract the downloaded ZIP to get `app-release.apk`.

This starter is a UI prototype with sample figures. Local database persistence, live demand calculation, sensor validation and safety-gated redistribution will be added in later steps.

## Safety note

Sensor readings do not establish food safety. Redistribution requires operator verification of batch metadata and the approved handling window.

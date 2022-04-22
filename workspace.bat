@echo off
echo "=== WORKSPACE SCRIPT RUNNING ==="
mkdir nekoya_flutter
cd nekoya_flutter
git clone https://gitlab.com/nekoya/app.git .
flutter create .
flutter pub get
echo "=== DONE :3 ==="
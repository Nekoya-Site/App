echo "=== WORKSPACE SCRIPT RUNNING ==="
mkdir nekoya_app
cd nekoya_app
git clone https://gitlab.com/nekoya/app.git .
flutter create .
flutter pub get
flutter pub run flutter_launcher_icons
echo "=== DONE :3 ==="
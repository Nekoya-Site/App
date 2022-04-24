echo "=== WORKSPACE SCRIPT RUNNING ==="
mkdir nekoya_flutter
cd nekoya_flutter
git clone https://gitlab.com/nekoya/app.git .
flutter create .
flutter pub get
flutter pub run flutter_launcher_icons_maker:main
echo "=== DONE :3 ==="
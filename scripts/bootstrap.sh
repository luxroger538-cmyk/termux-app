#!/data/data/com.termux/files/usr/bin/bash

echo "🚀 PowerTerm setup starting..."

# Update system
pkg update -y
pkg upgrade -y

# Install required packages
pkg install -y python git nodejs neofetch proot-distro

# Install VS Code server
npm install -g code-server

# Create dashboard file automatically
cat > ~/dashboard.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
clear
echo "-----------------------------------"
echo "        POWER-TERM DASHBOARD       "
echo "-----------------------------------"
echo "[1] Open Linux (Debian)"
echo "[2] Install / Update Packages"
echo "[3] System Info"
echo "[4] Start VS Code Server"
echo "[5] Exit"

read -p "Select option: " opt

case $opt in
  1) proot-distro login debian ;;
  2) pkg update && pkg upgrade ;;
  3) neofetch ;;
  4) code-server --bind-addr 0.0.0.0:8080 ;;
  *) exit ;;
esac
EOF

# Make dashboard executable
chmod +x ~/dashboard.sh

# Add command shortcut
cp ~/dashboard.sh $PREFIX/bin/powerterm
chmod +x $PREFIX/bin/powerterm

echo "✅ Setup complete! Type 'powerterm' to start dashboard."

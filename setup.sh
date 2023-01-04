#!/data/data/com.termux/files/usr/bin/bash
if [ `getprop ro.build.version.release` -lt 7 ]; then
        echo "Android versions below 7 are not supported!"
        exit 1
fi
pkg upg -y
echo "Installing termux-user-repository repo..."
pkg i tur-repo x11-repo -y > /dev/null 2>&1
echo 1.nodejs
echo 2.nodejs-lts
read -p "Select the nodejs version you want to install：" -n 1 njs
case $njs in
1)
      printf "\nInstalling nodejs..." && pkg i nodejs -y;;
2)
      printf "\nInstalling nodejs-lts..." && pkg i nodejs-lts -y;;
*)
      printf "\nError!"&&exit;;

esac
echo "Installing electron..."
pkg i electron -y> /dev/null 2>&1
echo "Fixing variables..."
echo "#!/data/data/com.termux/files/usr/bin/bash" >> $PREFIX/etc/profile.d/electron-nodejs.sh
echo export ELECTRON_SKIP_BINARY_DOWNLOAD=1 >> $PREFIX/etc/profile.d/electron-nodejs.sh
echo export ELECTRON_OVERRIDE_DIST_PATH=/data/data/com.termux/files/usr/bin >> $PREFIX/etc/profile.d/electron-nodejs.sh
source $PREFIX/etc/profile.d/electron-nodejs.sh
echo "Done!"
exit 0

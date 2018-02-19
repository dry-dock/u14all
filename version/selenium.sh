#!/bin/bash -e

echo "================= Installing Selenium PreReqs ==================="
apt-get update
sudo apt-get install -y xvfb firefox unzip

sudo apt-get install -y \
  ca-certificates \
  gconf-service \
  hicolor-icon-theme \
  libappindicator1 \
  libasound2 \
  libcanberra-gtk-module \
  libcurl3 \
  libexif-dev \
  libgconf-2-4 \
  libgl1-mesa-dri \
  libgl1-mesa-glx \
  libnspr4 \
  libnss3 \
  libpango1.0-0 \
  libv4l-0 \
  libxss1 \
  libxtst6 \
  fonts-liberation\
  xdg-utils \
  --no-install-recommends

echo "================= Installing Chrome ==================="
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -y -f
sudo rm -f google-chrome-stable_current_amd64.deb

echo "================= Installing Chrome driver ==================="
# install latest chromedriver release as we are installing latest stable chrome version
CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`
sudo wget http://chromedriver.storage.googleapis.com/"$CHROME_DRIVER_VERSION"/chromedriver_linux64.zip
sudo unzip chromedriver_linux64.zip && sudo rm -f chromedriver_linux64.zip
sudo mv chromedriver /usr/local/bin/chromedriver
sudo chmod a+x /usr/local/bin/chromedriver

sudo apt-get install firefox chromium-browser;
sudo ln -s /usr/bin/chromium-browser /usr/bin/chrome;
sudo apt-get -f install;

wget -q -O- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable

echo "================= Installing Opera ==================="
wget -q -O-  http://deb.opera.com/archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://deb.opera.com/opera/ stable non-free" > /etc/apt/sources.list.d/opera.list'
sudo apt-get update
sudo apt-get install -y opera

echo "================= Installing Selenium ==================="
sudo mkdir /usr/local/selenium >/dev/null 2>&1
sudo wget http://selenium-release.storage.googleapis.com/3.8/selenium-server-standalone-3.8.1.jar -P /usr/local/selenium

echo "================= Removing google chrome from updation list ==================="
rm -f /etc/apt/sources.list.d/google-chrome.list
cd /var/lib/apt
sudo mv lists lists.old
sudo mkdir -p lists/partial
sudo apt-get update

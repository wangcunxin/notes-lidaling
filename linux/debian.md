### fcitx install

  sudo aptitude install fcitx fcitx-table-wubi
  sudo apt-get install fcitx-table-wbpy

### update-alternatives

  sudo update-alternatives  --install /usr/bin/java java  /home/lidl/soft/jdk/bin/java   1888

### set system language

  dpkg-reconfigure locales

### rtlwifi/rtl8723 wifi驱动　安装　

  sudo aptitude search firmware-realtek
  sudo aptitude install firmware-realtek

### nonfree support

```
deb http://ftp.us.debian.org/debian/ wheezy main contrib non-free
deb-src http://ftp.us.debian.org/debian/ wheezy main contrib non-free

deb http://security.debian.org/ wheezy/updates main contrib non-free
deb-src http://security.debian.org/ wheezy/updates main contrib non-free

# wheezy-updates, previously known as 'volatile'
deb http://ftp.us.debian.org/debian/ wheezy-updates main contrib non-free
deb-src http://ftp.us.debian.org/debian/ wheezy-updates main contrib non-free
```

add `main contrib non-freemain contrib non-free` after each line

[xmodlo](http://ask.xmodulo.com/install-nonfree-packages-debian.html)

## other tools

- gvim

	sudo apt-get install vim-gnome

### simple chinese to english

	sudo dpkg-reconfigure locales

then select en_US.UTF-8,and step in

### set default editor on linux

  sudo update-alternatives --config editor

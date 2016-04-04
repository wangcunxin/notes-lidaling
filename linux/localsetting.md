## ocale.Error: unsupported locale setting

- centos

  vim /etc/environment

add

  LANG=en_US.UTF-8
  LC_ALL=en_US.UTF-8

- debian

  dpkg-reconfigure locals

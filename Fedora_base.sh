#!bash

yum update -y
yum upgrade -y

# programas base

dnf install git nano htop youtube-dl wget elinks wget curl \
python-pip redshift R macchanger nmap terminator transmission \
gnome-tweaks gimp okular vim -y

/usr/bin/python2.7 -m pip install --upgrade --user virtualenv

#vlc 

dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
  dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E  %fedora).noarch.rpm -y
  dnf install vlc dnf-plugins-core -y 

#Docker 

dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
dnf makecache
dnf install docker-ce -y
systemctl enable docker.service
systemctl start docker.service

# tor 

mkdir tor
cd tor
wget https://www.torproject.org/dist/torbrowser/8.5.4/tor-browser-linux64-8.5.4_en-US.tar.xz
tar -xvJf tor-browser-linux64-8.5.4_en-US.tar.xz

#rstudio

cd && mkdir Rstudio && cd Rstudio
wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-1.2.1335-x86_64.rpm 
dnf install compat-openssl10.x86_6
sudo dnf localinstall rstudio-1.2.1335-x86_64.rpm 

# librerias fundamentales

/usr/bin/python2.7 -m pip install --upgrade --user virtualenv

echo " local({
  r <- getOption('repos')
  r['CRAN'] <- 'http://cran.cnr.berkeley.edu/'
  options(repos = r)
}) ;
install.packages(c('keras','ggplot2',
'caret','e1071','randomForest','MASS',
'tensorflow','zoo','stringr','dplyr',
'lubridate','shiny','shinydasboard','neuralnet')) ; 
library(keras) ; library (tensorflow) 
install_keras() ; install_tensorflow() " > libs.R && Rscript libs.R

# SSH

dnf install -y openssh-server
systemctl start sshd.service
sudo systemctl enable sshd.service

# Wordpress
mkdir Wordpress && cd Wordpress
wget https://public-api.wordpress.com/rest/v1.1/desktop/linux/download

# Anaconda

wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
bash Anaconda3-2019.07-Linux-x86_64.sh
source ~/.bashrc

# Actualizar

yum update -y
yum upgrade -y

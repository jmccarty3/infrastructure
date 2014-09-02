#just to be sure puppet master is installed
sudo apt-get -y install puppetmaster 

if puppet module list | grep -q jtopjian-reprepro; then
    echo "Reprepro already exists"
else
    puppet module install jtopjian-reprepro
fi

if puppet module list | grep -q jtopjian-apt_mirror; then
    echo "apt_mirror already exists"
else
    puppet module install jtopjian-apt_mirror
fi

if puppet module list | grep -q jfryman-nginx; then
    echo "Nginx module already exists"
else
    puppet module install jfryman-nginx 
fi

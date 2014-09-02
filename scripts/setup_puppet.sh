#install wget if it is missing
sudo apt-get update
sudo apt-get install wget 

#move to the temp directory
cd /tmp
wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb

sudo dpkg -i puppetlabs-release-precise.deb

#Make sure the new package is found
sudo apt-get update
sudo apt-get -y install puppet


if grep -q puppet /etc/hosts; then
    echo "I know where the  puppet master is"
else
    echo "Instering puppet master entry"

    echo "192.168.50.100 master.localdomain master puppet puppet.localdomain" >> /etc/hosts
fi

domainname localdomain

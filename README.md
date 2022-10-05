# home
Configs for bootstraping my user on new servers


###### Run mininal script
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/drunkbatya/home/main/install.sh)"
```

###### Download and run full playbook
```bash
sudo apt install ansible
wget -Nq "https://raw.githubusercontent.com/drunkbatya/home/main/install_drunk_packages.yml" && chmod +x install_drunk_packages.yml && ./install_drunk_packages.yml
```

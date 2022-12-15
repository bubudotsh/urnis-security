
# Urnis

Urnis is a script that performs a security audit of your system.


## Function
    - Detect malware by scan files
    - Recommendation of programs and actions for better security
    - Update your system
    - Generation of a security audit
    - Send a security audit by mail
    - report user with empty password
    - report user with admin right
    - report open port
    - list of admin services
    - firewall status
    - software and hardware information of your system


## Require
    - netsat
    - python3


## Installation

git clone this repo

```bash
  chmod +x setup.sh
  sudo ./setup.sh
```
After running the setup you can delete the "urnis-security" directory


Configuration of urnis

```bash
sudo vim /usr/share/urnis/src/urnis.conf
```


## Usage/Examples

```bash
    Options : 
        -a      audit        make audit of your system
        -u      update       update of Urnis
        -l      look         generation of an audit every 12 hours automatically
        -m      audit mail   make audit of your system and send it by email
        -r      remove       remove all files of urnis

    Usage :
        sudo urnis -a
```

## Update

```bash
  urnis -u
```


## Authors

- [@bubudotsh](https://www.github.com/bubudotsh)

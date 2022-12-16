
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



## Configuring

Configure mail

```bash
sudo vim /usr/share/urnis/src/urnis.conf
```

Add programs to check
```bash
sudo vim /usr/share/urnis/src/pro.txt
```

Add directories to check
```bash
sudo vim /usr/share/urnis/src/dir.txt
```


## Usage/Examples

```bash
    Options : 
        -h      help         help of urnis
        -a      audit        make audit of your system
        -u      update       update of Urnis
        -l      look         generation of an audit every 12 hours automatically
        -m      audit mail   make audit of your system and send it by email
        -r      remove       remove all files of urnis
        -k      kill         stop look mode of urnis

    Usage :
        sudo urnis -a
```

## Update

```bash
  urnis -u
```


## Authors

- [@bubudotsh](https://www.github.com/bubudotsh)

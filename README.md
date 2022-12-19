
# Urnis

Urnis is a script that performs a security audit of your system.


## Function
    - Detect malware by scan files
    - Recommendation of programs and actions for better security
    - Update your system
    - Generation of a security audit
    - Send a security audit by mail
    - Report user with empty password
    - Report user with admin right
    - Report open port
    - List of admin services
    - Firewall status
    - Software and hardware information of your system
    - Give recommendationsto secure your system
    - Boot information


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
        OPTION  NAME         DESCRIPTION
        -h      help         help of urnis
        -a      audit        make audit of your system
        -u      update       update of Urnis
        -l &    look         generation of an audit every 12 hours automatically
        -m      audit mail   make audit of your system and send it by email
        -r      remove       remove all files of urnis
        -k      kill         stop look mode of urnis
        -s      status       status of look mode

    Usage :
        sudo urnis -a
```

## Update

```bash
  urnis -u
```


## Authors

- [@bubudotsh](https://www.github.com/bubudotsh)

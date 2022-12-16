import getpass
import os
import time
import datetime
import smtplib
import sys
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import mimetypes
from email.message import EmailMessage

sender = sys.argv[1]
passw = sys.argv[2]
reciver = sys.argv[3]
path = sys.argv[4]

def mail () :

    #send mail
    fi = open(path, 'r')
    s = fi.read()

    #send mail
    msg = MIMEMultipart()
    msg['From'] = sender
    msg['To'] = reciver
    msg['Subject'] = 'Urnis'  
    message = s
    msg.attach(MIMEText(message))
    mailserver = smtplib.SMTP('smtp-mail.outlook.com', 587)
    mailserver.ehlo()
    mailserver.starttls()
    mailserver.ehlo()
    mailserver.login(sender, passw)
    mailserver.sendmail(sender, reciver, msg.as_string())
    mailserver.quit()

    print ("mail send")
mail()
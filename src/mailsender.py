import getpass
import os
import time
import datetime
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import mimetypes
from email.message import EmailMessage

def mail () :

    #send mail
    fi = open("data/audit", 'r')
    s = fi.read()

    #send mail
    msg = MIMEMultipart()
    msg['From'] = 'sender'
    msg['To'] = 'recevier'
    msg['Subject'] = 'ssh new connexion'  
    message = s
    msg.attach(MIMEText(message))
    mailserver = smtplib.SMTP('smtp-mail.outlook.com', 587)
    mailserver.ehlo()
    mailserver.starttls()
    mailserver.ehlo()
    mailserver.login('sender', 'sendermdp')
    mailserver.sendmail('sender', 'recevier', msg.as_string())
    mailserver.quit()

    print ("mail send")

mail()
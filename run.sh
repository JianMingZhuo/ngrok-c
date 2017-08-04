#!/bin/sh
./ngrokc -SER[Shost:localhost.com,Sport:14443] -AddTun[Type:http,Lhost:127.0.0.1,Lport:80,Sdname:test]

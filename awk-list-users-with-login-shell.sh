#!/bin/bash
cat ~/passwd.txt | awk \
'
BEGIN { FS=":"; }
{ 
	if ( $7 != "/usr/sbin/nologin" && $7 != "/bin/false" )
		print $0;
}
'


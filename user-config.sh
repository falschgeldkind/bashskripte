#!/bin/bash


repeat_until_succesfull() {
	result=`"$@"`
	if [ $? -eq 0 ]
	then
		echo $result
	else
		echo $(repeat_until_succesfull "$@")
	fi	
}

welcome() {
	zenity --title='Wilkommen!' --info --text='Dies ist Ihre erste Anmeldung an diesem Rechner. Zur ersten Einrichtung werden Informationen von Ihnen benötigt, die nach dieser Information abgefragt werden.'
}

askForMailUsermane() {
	zenity --title='TU-Mail Einrichtung' --text='Geben Sie den Nutzernamen Ihrer TU-Mailadresse ein:' --entry  --entry-text=Username
}

askForMailPassword() {
	zenity --title='TU-Mail Einrichtung' --text='Geben Sie Ihr TU-Mail Passwort ein:' --entry  --entry-text=Passwort --hide-text
}

if [ -e $HOME/.UCS_flag ]  
then  
	exit 0
	#zenity --info --text="Nothing todo..."
else
	date +%F+%TB > $HOME/.UCS_flag
	#repeat_until_succesfull welcome
    #username=`repeat_until_succesfull askForMailUsermane`
	#password=`repeat_until_succesfull askForMailPassword`
	#zenity --info --text="Username: $username\nPassword: $password"
fi  


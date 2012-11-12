#Backdrop-randomizer
Companion for xfdesktop which randomly cycles through wallpapers without repeating.

##Usage
* Copy the script to whatever you wish (/usr/bin for example).
* Define the path to your pics in $HOME/.config/backdrop-randomizer.conf (currently only .jpg files are supported).
* Call the script via cronjob at the desired interval. (Below example shows once every 20 min).
  
	*/20 * * * *  /usr/bin/backdrop-randomizer

* Hint for newbies: add the above line with crontab like this: `crontab -e`

##How it works
Each time you or cron calls the script, it will randomly select a picture from your list to display. It will then remove the selection from the list so as not to repeat the same pic twice per cycle. When backdrop-randomizer sees you have only one pic left in your list, it regenerates the list anew and continues to cycle. The net effect is an endless rotation of your pics without a repeat.

##Links
* AUR Package: https://aur.archlinux.org/packages/backdrop-randomizer
* Wiki: https://wiki.archlinux.org/index.php/backdrop-randomizer

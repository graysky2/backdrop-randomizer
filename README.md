#Backdrop-randomizer
Backdrop-randomizer is a companion for xfdesktop which randomly cycles through wallpapers without repeating them until all have been displayed once. I wrote it specifically for xfce4 users displaying desktop pics with xfdesktop.

##Rationale and Gap
Xfdesktop has a gap currently: it does not keep track of which images in a list are displayed as "backdrops" to the DE.  The result is that some images in a list get displayed frequently while others are rarely displayed.  A more robust implementation of the random background feature should randomly display an image in the list and not repeat it until all list members have been displayed at least once.

##How It Works
Each time you or cron calls the script, it will randomly select a picture from your list to display. It will then remove the selection from the list so as not to repeat the same pic twice per cycle. When backdrop-randomizer sees you have only one pic left in your list, it regenerates the list anew and continues to cycle. The net effect is an endless rotation of your pics without a repeat.

##Usage
* Call the script to create $XDG_CONFIG_HOME/backdrop-randomizer.conf wherein you will define your options..
* Right-click the xfce4 desktop and select Desktop Settings > Background.
* Setup the image to "Single image" and select the symlink that the script made for you which is by default: $XDG_CONFIG_HOME/backdrop-randomizer.jpg
* Call the script via cronjob at the desired interval. (Below example shows once every 20 min). Hint for newbies: edit your crontab like this: `crontab -e`
  
	*/20 * * * *  /usr/bin/backdrop-randomizer R

	To add a pic to the database without recreating it, simply call the script with the 'A' functinon followed by the filename to add.

	Example: backdrop-randomizer A newpic.jpg

##Links
* AUR Package: https://aur.archlinux.org/packages/backdrop-randomizer
* Discussion Thread: https://bbs.archlinux.org/viewtopic.php?id=152755

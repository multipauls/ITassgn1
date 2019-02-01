Q1) Songlist

	Command for adding entries: 	./addentry.sh <songname(mandatory)> <singer(mandatory)> <youtube link(optional)> <genre(optional)>
		The songs will be saved in a file called songlist.txt in the current directory.
		The list will not accept duplicate songs (i.e. songs with the same songname and singer (case sensitive)).
		The genre cannot be added before the link using the addentry command, but this can be done using the editentry command.
		
		Eg: 	./addentry "Fireflies" "Owl City" "www.youtube.com" "Pop"


	Command for editing entries: 	./editentry.sh <songname(mandatory)> <singer(mandatory)>
		The script has options to edit each field individually.
		The list will not accept duplicate entries. (case sensitive)

		Eg. 	./editentry "Fireflies" "Owl City"
			Do you want to edit songname? [Y/N]
			Y
			Enter new songname
			Hello
			Do you want to edit singer? [Y/N]
			Y
			Enter new singer
			Adele
			Do you want to edit/add youtube link? [Y/N]
			N
			Do you want to edit genre? [Y/N]
			N


	Command for deleting entries: 	./deleteentry.sh <songname(mandatory)> <singer(mandatory)>

		Eg.	./deleteentry "Fireflies" "Owl City"

	Command for viewing all entries: ./viewentry.sh
		The songlist is displayed in columns in the order ID number, Songname, Singer, Youtube link, Genre
		
		Eg.	./viewentry.sh                                                              
			1  Hello             Adele
			2  Fireflies         Owl City
			3  A Million Dreams  The Greatest Showman  www.youtube.com  Pop


	Command for viewing selected entries: ./viewselect <songname(optional)> <singer(optional)> <genre(optional)>
		Atleast 1 argument is required for the script (either songname, singer or genre, or any combination of the three).
		The arguments need not be in the given order.
		The arguments are not case sensitive.
		
		Eg. 	./viewselect.sh Pop                                                         
			3  A Million Dreams  The Greatest Showman  www.youtube.com  Pop


Q2) Search Engine
	
	Command for searching: 		bash searching.sh <searchstring(mandatory)> <url(mandatory)>
		
		Eg. 	bash searching.sh anime www.fanfiction.net
			anime
			8

Q3) Timer with notifications
	
	Command for setting up timer: 	bash timer.sh <iterations (mandatory)>
		The timer for the first iteration of work is started immediately.
		The timer runs in the foreground (unless & is added to the end of the command)
		The notifications are printed in the terminal.
		An extra 15 mins is added to the break every 4th iteration.
		
		Eg:	bash timer.sh 2
			1
			work
			1
			break
			2
			work
			2
			break

Bonus: 	Command for setting up timer: 	bash timerbonus.sh <iterations (mandatory)>
		notify-send package must be installed for this script.
		The timer for the first iteration of work is started immediately.
                The timer runs in the foreground (unless '&' is added to the end of the command)
                The notifications are sent as desktop notifications.
                An extra 15 mins is added to the break every 4th iteration.

		Eg:	bash timerbonus.sh 2

Q4) Reminder list
	
	Command to install dependencies: 	./reminddep.sh
		The command installs the notify-osd package required.
		Sudo permissions are needed to run this script.

	Command to add reminders: 	./remindadd.sh <time (hh:mm:ss)(mandatory)> <date (dd/mm/yy)(mandatory)> <body (mandatory)>
		The reminder will be saved in a file called remindlist.txt in the current directory	                
		The script runs in the foreground (unless '&' is added to the end of the command)
		The notifications are sent as desktop notifications.
		notify-send package must be installed for this script (using reminddep.sh).
	
		Eg: 	./remindadd.sh 23:07:59 30/01/19 "Remind Me 2" &

	Command to show reminders: 	./remindshow.sh "-d"(optional) 
					./remindshow <substring(optional)>
		The reminder list is displayed in columns in the order ID number, time, date, body.
		Given no arguments, the list is sorted by time.
		Given the flag "-d", the list is filtered by date and sorted by id.
		Given any other substring, the list is filtered by substring and sorted by id.
		
		Eg.	./remindshow.sh Remind
			1  23:07:59  30/01/19  Remind Me 2
			2  23:07:59  30/01/19  Remind Me 2
			3  23:07:59  30/01/19  Remind Me
			
			./remindshow.sh -d 30/01/19
			1  23:07:59  30/01/19  Remind Me 2
			2  23:07:59  30/01/19  Remind Me 2
			3  23:07:59  30/01/19  Remind Me

	Command to edit reminders:	./remindedit.sh
		The script prompts the user to enter id number, new time, new date, and new body for the reminder.
		
		Eg.	./remindedit.sh  
			Enter id
			1
			Enter new date in dd/mm/yy format
			09/08/20
			Enter new time in hh:mm:ss format
			08:09:11
			Enter new body
			Hello

	
	Command to delete reminders:	./reminddelete.sh <id(mandatory)>
		
		Eg.	./reminddelete.sh 1

Q5) Script1.sh
	
	Command to run scripts: ./script1.sh
		Prints recursively the last modified date and time and the file name of the all the files in the current working directory in a given format 
		Finds all the commands that starts the word “lo” and stores the commands and their small
descriptions in a file named 2018113004.txt.
		Displays the number of lines and the length of the longest line in 2018113004.txt

		Replaces all the occurrences of the word “function” with “method” in 2018113004.txt.
		Creates a backup of your original file “your_roll_no.txt”.

   Script2.sh
	
	Command to run scripts:	./script2.sh
		Concatenates these file1.csv & file2.csv into a single file named target_file.csv
		Creates a header file named header.csv
		Adds this header file at the beginning of the target_file.csv
		Replaces '?' missing values with 2018113004

Q6) Movies List
	Command to add movies: bash q6.sh <filepath1/filename> <folderpath>
		Reads movies and from filepath1/filename and sorts into folders named Awesome, Good, Average, Bad in folderpath under the following criteria
			If the rating < 5 : Bad
			If rating is >=5 and <8 : Average
			If rating >= 8 and <9 : Good
			If rating >= 9 : Awesome
		Movies are saved as empty files: moviename.mp4

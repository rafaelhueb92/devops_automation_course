# FILE & DIRECTORY LISTING
```bash
ls -lah          # list all files with details, human-readable sizes, including hidden
pwd		 # Current folder
```

# OUTPUT & DISPLAY
```bash
echo "text"      # print text to stdout
cat file.txt     # display entire file content
head file.txt    # show first 10 lines (use -n for custom)
tail file.txt    # show last 10 lines (use -n for custom, -f to follow)
```

# SEARCH
```bash
grep "pattern" file.txt    # search for pattern in file
grep -r "pattern" dir/     # recursive search in directory
grep -i "pattern" file     # case-insensitive search
```

# TEXT PROCESSING
```bash
awk '{print $1}'           # print first column
awk -F: '{print $1}'       # print first column with : delimiter
awk '/pattern/ {print}'    # print lines matching pattern
awk '{sum+=$1} END {print sum}'  # sum first column
```

# File & Directory Operations

```bash
cp source dest       # copy file or directory
cp -r dir1 dir2      # copy directory recursively
mv old_name new_name # move or rename file/directory
rm file.txt          # remove file
rm -rf dir/          # remove directory and contents forcefully
ls -lah              # list all files with details and hidden files

# PROCESS MANAGEMENT
```bash
ps               # show current processes
ps aux           # show all processes with details
top              # real-time process monitor (press q to quit)
sleep 300        # pause for 300 seconds
sleep 300 &      # pause for 300 seconds in background
```

# REDIRECTION
```bash
command > file   # redirect output to file (overwrite)
command >> file  # redirect output to file (append)
command 2> file  # redirect errors to file
```
# BACKGROUND JOBS
```bash
command &        # run command in background
jobs             # list background jobs
fg               # bring background job to foreground
```

# SYSTEM
uname -a 	# Get system info
whoami 		# Current User
who		# Who is logged
w		# who is logged and what they are doing
df -h		# All volumes
du -sh <folder> # Size of the folder
free -m 	# Total and free memory
uptime		# How much time the server is on
history		# show the previous command
sudo shutdown -h now # Shutdown the server, BE CAREFUL!
reboot 		# reboot server

# FILE PERMISION
chmod 	# Change the permissions of the file rwx 124 user group others | you can use +rwx also
chown	# Change owner

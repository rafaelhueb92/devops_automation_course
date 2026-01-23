# FILE & DIRECTORY LISTING
```bash
ls -lah          # list all files with details, human-readable sizes, including hidden
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

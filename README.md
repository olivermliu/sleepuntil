# sleepuntil (bash)
Sleep until a certain time, instead of for a certain duration.

The command `sleep` of GNU coreutils allows a user to suspend execution for a certain **duration**. This is useful to delay running a succeeding command for the specified duration.

However, should the user want to delay a command to run until a certain point in time, they would need to calculate the time difference between their current time and the desired execution time.

This proves to be difficult if the desired execution time lies temporally far, and/or time-consuming if the user makes use of this functionality often.

**sleepuntil** allows users to use ISO 8601 timestamps (with the format YYYY-MM-DDTHH:MM:SS) to specify a time until which to sleep.

## Installation
1. download the file `sleepuntil.sh`
2. place file into `/usr/local/bin` (or your location of choice, if you're familiar with your OS)
3. `sudo chmod u+x /usr/local/bin/sleepuntil.sh` to add execution rights to user
4. `sudo ln -s /usr/local/bin/sleepuntil.sh /usr/local/bin/sleepuntil` to allow using the command `sleepuntil` instead of `sleepuntil.sh`
5. `sudo chmod u+x /usr/local/bin/sleepuntil` to add execution rights of this "alias" to user

alternatively to steps 4-5, just `alias sleepuntil="sleepuntil.sh"` in your shell rc file.

## Usage
To sleep until January 1st, 2022 at 10:30 PM:
```
sleepuntil 2022-01-01T22:30:00
> Sleeping for 295 day(s) 5 hour(s) 11 minute(s) 5 second(s) until Sat 01 Jan 2022 10:30:00 PM CET
```

To execute something after sleeping:
```
sleepuntil 2021-10-01T00:00:00; echo "September has ended"
> Sleeping for 202 day(s) 5 hour(s) 37 minute(s) 26 second(s) until Fri 01 Oct 2021 12:00:00 AM CEST
(202 days, 5 hours, 37 minutes and 26 seconds later):
> September has ended
```

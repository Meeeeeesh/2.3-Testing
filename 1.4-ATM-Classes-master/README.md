1.4-ATM-Classes - Andrew T. Poe

This program contains a significant refactoring on the prior ATM programs I have submitted.

Program remains fully object oriented. Each class is now broken into separate files that must first be imported into the main file, 'assignment.rb'

Program imports user account data, and updates the file whenever a new withdrawal takes place. I accomplished by performing a complete rewrite of the file, whose contents are currently stored in the memory. This is sufficient for this example, but a more real world application would require updating only the piece of information being changed.

Several bug fixes have also been completed. In past programs withdrawing a negative amount would actually add money to both the user's account and the ATM's balance.

Go ahead and give it a try. I'll provide a list of valid logins below:

    Name    Pin
    Sean    1234
    Pam     2345
    Jamie   3456
    Ken     4567
    Liz     5678
    Meeesh  6789
    Andrew  7890
    Gregg   8901
    Stan    9012
    Adam    0123

The machine's balance will reset when you reboot the program, but when a user runs out of money they are bankrupt!

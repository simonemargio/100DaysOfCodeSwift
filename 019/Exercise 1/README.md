## Structures Exercise

# Instructions

You are about to create the next big social networking app, exclusive to business leaders called KingPin.

## Define a Structure

As part of this app, you need to define a struct called `User` to represent a user.

This struct needs to hold onto the user's name, email (optional), number of followers, and whether they are active or not. The User struct needs to have the properties:

`name`

`email?`

`followers`

`isActive`

The Struct also needs to have a method called `logStatus()`. If the user is active, the method needs to print "XXX is working hard". Otherwise, it needs to print "XXX has left earth" (where XXX is the name of the user).

## Initialise the Structure

After you have defined the struct, create a user with the name "Richard" with 0 followers who not active. Then print the status of this user to the console with `logStatus()`.

To succeed in this challenge, the console will need to read:
```
Richard has left earth

Diagnostic code (i.e., Challenge Hint):
Elon is working hard
Contacting Elon on elon@tesla.com ...
Elon has 2001 followers
Elon has left earth
```


# simple auth

a flutter project conists of empty app with homepage which says welcome username ,
before it lets in user has to sign in or signup which is authenticated by firebase authication 
the user name and email such user data is stored in cloud database service provided by google cloude firestore

starting of the app for a new user it starts with get started page where user is asked to either signin or signup 
then once user is filled with form and submits it redirects to welcome page 
also login page comes with fogot password option 
the validation of each text field with regex pattern 
during each await moment the is a loading screen and is come across any error there is error screen.


## file and dependencies 
check out pubspec.yaml in repo for linking all the image assests and fonts 
also for plugins visit dart plugin offical site refer version from ymal file
and images and fonts are in assets and fonts folder

ridirections are in screens folder includes login,signup,errorpage etc,
homepage in home file,
shared has loading screen,
database service file and authentication service file in service folder,
user data model which are taken instance later are in models folder,

also check out app level , root level build gradle 



 

## get started


ref youtube -
for basics flutter app project https://youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ&si=EPp0drbIp17hCO5C
and for firebase and firestore https://youtube.com/playlist?list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&si=tPJtYWt158ywbWGM

for font files-
https://fonts.google.com/

auth and DBservice -
https://firebase.google.com/

images- 
https://www.pinterest.com/

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

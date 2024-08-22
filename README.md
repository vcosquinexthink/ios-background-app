
experiments:

#1
run the app in IOS simulator, click the "Share current location
button".
in the application logs see how a background thread keeps checking
location every 5 seconds.
In the simulator menu, click Features>Location>Custom Location and
update the simulator location.

[x] kill the application and see how the thread is killed and the app stops
updating the application.

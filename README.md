
experiments:
#2
does not work in simulator, it doesn't allow you to schedule background
processes, a phisical device is needed

#1 background thread [2f8cee0888812db95d1173c8622baa54cc04d757](https://github.com/vcosquinexthink/ios-background-app/commit/2f8cee0888812db95d1173c8622baa54cc04d757)

run the app in IOS simulator, click the "Share current location
button".
in the application logs see how a background thread keeps checking
location every 5 seconds.
In the simulator menu, click Features>Location>Custom Location and
update the simulator location.

[v] put app in background and see how the background process continues working from a while (tested for 1000 secs)
[x] kill the application and see how the thread is killed and the app stops
updating the application.

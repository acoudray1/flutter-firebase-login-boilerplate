# flutter-firebase-login-boilerplate
A flutter application's boilerplate with firebase authentication.

## Quick overview
This repository has been made for anyone who would like to start creating a new application that uses firebase and that already has an authentication system.
The boilerplate application uses the [flutter-bloc](https://bloclibrary.dev/#/) implementation and is highly customisable. OTher things were added in this project like the theme handling for example. 

## Architecture
The application file tree is like the following :
```
.
|
+-- blocs
|   +-- application
|      +-- application bloc, states and events : handles the state of the user's connection
|      +-- root bloc, states and events : handles the display of generic things on the UI like alert dialog or snackbar
|   +-- authentication
|      +-- authentication bloc, states and events : handles the user's login with firebase through the authentication screens
|   +-- ... make a directory for each screens that requires a bloc to handle it
+-- configuration
|   +-- properties : add properties files if required
|   +-- theme
|      +-- theme_notifier.dart : widget that changes the theme when asked + dark and light theme implementation
|      +-- custom_font_style.dart : a class with different types of fonts
+-- models
|   +-- classes : add the different classes that you have
|   +-- enums : add the different enums that you have
+-- providers
|   +-- repositories : must call the `services` functions in order to provide data to screens / blocs... level of abstraction
|       between APIs and the other things so you can process as you want your data
|   +-- services : must call the different APIs in order to get some data
+-- screens
|   +-- authentication : the different widgets used for the login / signup
|   +-- components : generic components used in the whole application
|   +-- ... add a new directory for each of your screens
|      +-- components : the different components used in your screens
+-- _site
+-- index.html
```

## Installation

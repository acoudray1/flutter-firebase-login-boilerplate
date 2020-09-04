# flutter-firebase-login-boilerplate
A flutter application's boilerplate with firebase authentication.

The work here is still in progress (todo list below):
* [x] Add a button for the theming changes and show how it works
* [x] Add a disconnection button 
* [x] Add a forgot password screen and handle it
* [x] Add some pictures of the app on the README.md
* [x] Add email verification handling

## Quick overview
This repository has been made for anyone who would like to start creating a new application that uses firebase and that already has an authentication system.
The boilerplate application uses the [flutter-bloc](https://bloclibrary.dev/#/) implementation and is highly customisable. OTher things were added in this project like the theme handling for example. 

## Preview
Here is some pictures of the initial application you will get once it is configured.

<div style="text-align: center"><table>
<tr>
  <td style="text-align: center">
    <img src="https://github.com/acoudray1/flutter-firebase-login-boilerplate/blob/master/github_assets/welcome_page.png" height="auto" width="100%" align="middle">
  </td>
  <td style="text-align: center">
    <img src="https://github.com/acoudray1/flutter-firebase-login-boilerplate/blob/master/github_assets/login_page.png" height="auto" width="100%" align="middle">
  </td>
  <td style="text-align: center">
    <img src="https://github.com/acoudray1/flutter-firebase-login-boilerplate/blob/master/github_assets/signup_page.png" height="auto" width="100%" align="middle">
  </td>
</tr>
<tr>
  <td style="text-align: center">
    <img src="https://github.com/acoudray1/flutter-firebase-login-boilerplate/blob/master/github_assets/home_page_dark.png" height="auto" width="100%" align="middle">
  </td>
  <td style="text-align: center">
    <img src="https://github.com/acoudray1/flutter-firebase-login-boilerplate/blob/master/github_assets/forgot_pwd_page.png" height="auto" width="100%" align="middle">
  </td>
  <td style="text-align: center">
    <img src="https://github.com/acoudray1/flutter-firebase-login-boilerplate/blob/master/github_assets/home_page_light.png" height="auto" width="100%" align="middle">
  </td>
</tr>
</table></div>

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
|   +-- root.dart : the entry point of each screens you add to your application
+-- main.dart
.
```

## Installation
1. Clone the repository `git clone https://github.com/acoudray1/flutter-firebase-login-boilerplate.git`
2. Change the application id in the different files : `com.axelc.flutter-firebase-login-boilerplate` by your own application id.
3. Change the application name `name: flutter_firebase_login_boilerplate` in the `pubspec.yaml` file
4. Change import packages name `package:flutter_firebase_login_boilerplate` with `package:<application_name>`
5. Run `flutter packages get` in the root directory
6. Create a new firebase project on the [firebase console](https://console.firebase.google.com/)
7. Add a new application (IOS or Android) to your firebase project :
      * choose the application id you entered before
      * get the `google-services.json` / `GoogleService-Info.plist` and add it in the good directory
            (-> on android : `android/app/` (then sync gradle))
            (-> on IOS : `ios/Runner/` (don't forget to use XCode to do that))
8. Run the application, everything should work fine

P.S. : If there is any bug or if you encounter any problem you can contact me [here](axelcoudray1@gmail.com).
      



## Credits :
<a href="https://www.freepik.com/free-photos-vectors/travel">Travel vector created by slidesgo - www.freepik.com</a>

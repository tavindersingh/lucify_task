## Backend Setup
1. Make sure Node.js and NPM is installed in your system
2. `cd` to `backend` folder
3. Execute this command `npm install` to install the required dependencies
4. Execute this command to run the server `npm run dev`.


## App Setup
1. Make sure flutter is setup in your system
2. `cd` to `frontend/smart_attend_app` folder
3. Execute this command `flutter pub get` to install the required dependencies
4. Make sure to change the `serverUrl` in the file `lib/helpers/app_constants.dart` file. 
5. Execute this command `flutter run` to run the app in debug mode 
6. To create release apk file execute this command `flutter build apk --release`

##### Note: 
1. Make sure not to use `localhost` as the server url if running this project locally.
2. Make sure the computer and the mobile should be in the same network.
3. Server is hosted on Renderer free tier which will sleep after some time of inactivity so if you dont receive notification in 30 seconds then give it a try after 1 or 2 minutes

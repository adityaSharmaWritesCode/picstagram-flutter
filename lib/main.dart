import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:picstagram/responsive/mobile_layout.dart';
import 'package:picstagram/responsive/responsive.dart';
import 'package:picstagram/responsive/web_layout.dart';
import 'package:picstagram/screens/loginScreen.dart';
import 'package:picstagram/screens/registerScreen.dart';

void main() async {
  //Ensures that all the widgets have been built before the next line is executed.
  //Important as without it the firebase initialiser could run into a null check exception
  WidgetsFlutterBinding.ensureInitialized();
  //Initialises Firebase app (the web version requires the options variable, but the mobile version requires it to be null)
  //Hence, the following if/else condition :
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCZam7L4OLe8pt9Wl6LaVRQX_2F4tzT9P0",
        appId: "1:760480030603:web:aeced22e0e63360ac1198e",
        messagingSenderId: "760480030603",
        projectId: "picstagram-5d0f8",
        storageBucket: "picstagram-5d0f8.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Picstagram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        primaryColor: const Color.fromRGBO(0, 149, 246, 1),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontFamily: 'Grand_Hotel',
            color: Colors.white,
          ),
        ),
      ),
      // darkTheme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      // ),
      // home: const ResponsiveLayout(
      //   webScreenLayout: WebScreenLayout(),
      //   mobileScreenLayout: MobileScreenLayout(),
      // ),
      home: const RegisterScreen(),
    );
  }
}

//01:02:48

//TODO : Look up how to write firestore database rules

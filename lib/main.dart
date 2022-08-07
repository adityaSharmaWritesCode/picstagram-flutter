import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:picstagram/providers/user_provider.dart';
import 'package:picstagram/responsive/mobile_layout.dart';
import 'package:picstagram/responsive/responsive.dart';
import 'package:picstagram/responsive/web_layout.dart';
import 'package:picstagram/screens/loginScreen.dart';
import 'package:picstagram/screens/registerScreen.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Picstagram',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor:
              const Color.fromRGBO(0, 0, 0, 1), // MOBILE BACKGROUND COLOR
          primaryColor: const Color.fromRGBO(0, 149, 246, 1), // BLUE COLOR
          highlightColor: Colors.white, //PRIMARY COLOR
          disabledColor: Colors.grey, //SECONDARY COLOR
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
        home: StreamBuilder(
          //TODO :- other options are : idTokenChanges(), userChanges(), WHY DO THESE NOT WORK??
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                    webScreenLayout: WebScreenLayout(),
                    mobileScreenLayout: MobileScreenLayout());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            return LoginScreen();
          },
        ),
      ),
    );
  }
}

//04:45:00

//TODO : Look up how to write firestore database rules

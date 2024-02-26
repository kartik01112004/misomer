import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:misomer/views/after%20login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'views/login.dart';

Future main() async {
  String APIKEY = dotenv.get('APIKEY');
  String APPID = dotenv.get('APPID');
  String MESSAGINGSENDERID = dotenv.get('MESSAGINGSENDERID');
  String PROJECTID = dotenv.get('PROJECTID');
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: APIKEY,
          appId: APPID,
          messagingSenderId: MESSAGINGSENDERID,
          projectId: PROJECTID));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RESULT();
        } else {
          return LOGINPAGE();
        }
      },
    ));
  }
}

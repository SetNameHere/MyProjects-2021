import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myprojects/screens/CommunityChallenges.dart';
import 'package:myprojects/screens/Construction.dart';
import 'package:myprojects/screens/HomePage.dart';
import 'package:myprojects/screens/ChallengesOverview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp()); //initial starting point into the app
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
              home:  Center(
                  child: Text(
                      'Sorry es ist ein Fehler aufgetreten')));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'MyProjects', //title of the website
            initialRoute:
                '/Home', //Hompe subpage; showed when webpage is called
            routes: {
              //subpages according to url
              '/Home': (context) => HomePage(),
              '/under-construction': (context) => Construction(),
              '/learning-challenges': (context) => Learnpaths(),
              '/community-challenges': (context) => CommunityChallenges(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

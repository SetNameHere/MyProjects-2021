import 'package:flutter/material.dart';
import 'package:myprojects/DataModels/ChallengesModel.dart';
import 'package:myprojects/DataModels/LearningThemesModel.dart';
import 'package:myprojects/screens/Impressum.dart';
import 'dart:convert';

import 'package:myprojects/services/FirestoreService.dart';

class ChallengesScreen extends StatelessWidget {
  final LearningThemesModel theme;

  const ChallengesScreen(this.theme);

  Widget build(BuildContext context) {
    final Future<List<ChallengesModel>> _challenges =
        FireStoreService().getChallenges(theme.backendId);
    //build method for this page
    var screenSize = MediaQuery.of(context).size; //get the size of the screen
    final double height = screenSize.height -
        kToolbarHeight; // calculate the actual available height for the body on the screen
    double rahmen = screenSize.width *
        0.2 *
        2; //calculate a space which shall be blank on the screen
    return Scaffold(
      endDrawer: Drawer(
          //menu in the top right of the screen
          child: ListView(
        children: <Widget>[
          ListTile(
              //Button for routing to Sign-In/Register Page
              onTap: () => Navigator.pushNamed(context,
                  '/under-construction'), //when button is tapped, user is routed to this subpage
              title: Text(
                'Anmelden/Registrieren',
              )),
          ListTile(
              //button for routing to Lerningpaths subpage
              onTap: () => Navigator.pushNamed(context,
                  '/learning-challenges'), //when button is tapped, user is routed to this subpage
              title: Text(
                'Lern - Challenges',
              )),
        ],
      )),
      appBar: AppBar(
        backgroundColor: Colors.grey[600], //sets color of AppBar
        title: Row(children: <Widget>[
          TextButton(
            //Button on the top left which redirects the user always to the start page
            child: const Text(
              'MyProjects',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pushNamed(context, '/Home'),
          )
        ]),
      ),
      body: Container(
        //set a container for the whole body of the page
        color:
            Colors.white, //set the background color of the container to white
        child: SingleChildScrollView(
            //make the body scollable so that we are not limited in the space
            child: Column(
          //Elements of the body can be placed beneath each other
          children: [
            Container(
                //new container for text.
                width: screenSize.width - rahmen,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: height *
                              0.01), //insert an empty space under the appbar
                      SizedBox(
                        height: height * 0.15,
                        child: Image.memory(
                          //insert a picture
                          base64Decode(theme.imageB64),
                        ),
                      ),
                      SizedBox(
                        //insert an empty space under the picture
                        height: height * 0.07,
                      ),
                      Text(
                        theme.theme,
                        style: TextStyle(
                          fontSize: 35,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        //insert an empty space under the picture
                        height: height * 0.02,
                      ),
                      Text(
                        theme.longDescription,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                        //insert an empty space under the picture
                        height: height * 0.04,
                      ),
                      Text(
                        'Challenges',
                        style: TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/under-construction');
                          },
                          child: Text('Challenge hinzufügen')),
                      SizedBox(height: height * 0.03),
                      //In the following there is a list of cards for learning themes are defined
                      FutureBuilder(
                        // Initialize FlutterFire:
                        future: _challenges,
                        builder: (context, snapshot) {
                          // Check for errors
                          if (snapshot.hasError) {
                            return Center(
                                child: Text(
                                    'Sorry, die Challenges konnten leider nicht geladen werden.'));
                          }
                          // Once complete, show your application
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListView.builder(
                                itemCount: snapshot.data.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    child: ExpansionTile(
                                      title: Text(
                                        snapshot.data[index].titel,
                                        style: TextStyle(
                                            fontSize: 20,
                                            // decoration: TextDecoration.underline,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      children: [
                                        SizedBox(height: 10),
                                        Text(snapshot.data[index].description),
                                        SizedBox(height: 10),
                                      ],
                                      expandedAlignment: Alignment.centerLeft,
                                    ),
                                    color: Colors.grey[200],
                                  );
                                });
                          }

                          // Otherwise, show something whilst waiting for initialization to complete
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                    ])),
            SizedBox(height: height * 0.35),
            Impressum(),
          ],
        )),
      ),
    );
  }
}

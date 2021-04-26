import 'package:flutter/material.dart';
import 'package:myprojects/DataModels/CommunityChallengModel.dart';
import 'package:myprojects/Extensions/DrawerContent.dart';
import 'package:myprojects/screens/Impressum.dart';
import 'package:myprojects/services/FirestoreService.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityChallenges extends StatelessWidget {
  Widget build(BuildContext context) {
    //build method for this page
    var screenSize = MediaQuery.of(context).size; //get the size of the screen
    final double height = screenSize.height -
        kToolbarHeight; // calculate the actual available height for the body on the screen
    double rahmen = screenSize.width *
        0.2 *
        2; //calculate a space which shall be blank on the screen

    final Future<List<CommunityChallengeModel>> _learningThemes =
        FireStoreService().getCommunityChallenges();

    return Scaffold(
      endDrawer: Drawer(
          //menu in the top right of the screen
          child: DrawerContent()),
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
            SizedBox(
                height: height * 0.01), //insert an empty space under the appbar
            Container(
                //new container for text.
                width: screenSize.width - rahmen,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Text(
                        'Community Challenges',
                        style: TextStyle(
                          fontSize: 35,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Nichts ist so mächtig wie eine gut funktionierende Community von kompetenten Menschen die versucht gemeinsam eine Problemstellung zu lösen.\nDaher sollst du hier Challenges finden zu denen sich MyProjects Nutzer organisieren können um an diesen Problemstellung zu arbeiten. Zunächst (bis wir eine bessere technische Lösung umsetzen können) werden die Challenges und die Arbeit der Community an diesen, über GitHub Issues gemanaged.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: height * 0.035),

                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/under-construction');
                          },
                          child: Text('Challenge hinzufügen')),
                      SizedBox(height: height * 0.02),
                      //In the following there is a list of cards for learning themes are defined
                      FutureBuilder(
                        // Initialize FlutterFire:
                        future: _learningThemes,
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
                                        ElevatedButton(
                                            onPressed: () {
                                              launch(snapshot.data[index].link);
                                            },
                                            child: Text('Zum Issue')),
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
            SizedBox(height: height * 0.6), //insert empty space at the bottom
            Impressum(),
          ],
        )),
      ),
    );
  }
}

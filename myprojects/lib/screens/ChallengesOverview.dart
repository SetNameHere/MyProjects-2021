import 'package:flutter/material.dart';
import 'package:myprojects/DataModels/LearningThemesModel.dart';
import 'package:myprojects/Extensions/DrawerContent.dart';
import 'package:myprojects/screens/Impressum.dart';
import 'package:myprojects/services/FirestoreService.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myprojects/screens/Challenges.dart';

class Learnpaths extends StatelessWidget {
  Widget build(BuildContext context) {
    //build method for this page
    var screenSize = MediaQuery.of(context).size; //get the size of the screen
    final double height = screenSize.height -
        kToolbarHeight; // calculate the actual available height for the body on the screen
    double rahmen = screenSize.width *
        0.2 *
        2; //calculate a space which shall be blank on the screen

    final Future<List<LearningThemesModel>> _learningThemes =
        FireStoreService().getServices();

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
                      Stack(
                        children: [
                          SizedBox(
                            height: height * 0.4,
                            width: screenSize.width,
                            child: Image.asset(
                              //insert a picture
                              'images/Learningmodel.png',
                            ),
                          ),
                          Text(
                            'Lern - Challenges',
                            style: TextStyle(
                              fontSize: 35,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),

                      Text(
                        'MyProjects m??chte dich dabei unterst??tzen neue Kompetenzen zu erlernen. Unsere feste ??berzeugung ist dabei jedoch, dass nichts so effektiv ist, wie wenn du dich selbstst??ndig mit Themen besch??ftigst und versuchst bestimmte Aufgaben zu l??sen. Daher wirst du hier keine Tutorials oder Artikel finden die du dir einfach nur durchlesen musst. Artikel oder Videos die dir Wissen vermitteln gibt es gl??cklicherweise zu jedem Thema ausreichend immer verf??gbar im Internet.\nUnser Konzept sieht vor, dasss du hier Aufgaben, sogennante Challenges, zu etlichen Themenfelder findest die alle das Ziel haben dir bei Meistern der Challenge eine bestimmte Kompetenz zu verschaffen, aber auch in gewisser Weise zu attestieren. Denn nat??rlich kannst du gerne die dabei entstandenen Projekte auf deinem Profil ver??ffentlichen.\nDieser Ansatz mag manchaml frustrierend sein, denn du wirst mit unter lange ben??tigen um eine Challenge zu meistern. Aber du wirst dadurch sehr viel nachhaltiger lernen, Willensst??rke und Durchhalteverm??gen gewinnen und dar??ber hinaus die wichtigste Kompetenz im Leben erhalten: Dir selbst Dinge beizubringen.\nDenn obwohl dank des Internet grunds??tzlich alles Wissen immer verf??gbar ist, wird doch oft jemand fehlen der dir etwas beibringen kann. Daher musst du wissen wie du bspw. mit Hilfe des Internets jedes Thema selbst erlernen kannst.\nMyProjects m??chte dir ma??geblich dabei helfen herauszufinden mit welchen Themen und welchen Aufgabenstellungen zu einem Thema du dich besch??ftigen solltest.\nWenn du bspw. zuk??nftig aktiv an MyProjects mitarbeitern m??chtest oder generell kompetent im Bereich Softwareentwicklung sein m??chtest, empfehlen wir dir, dich mit den Themen Flutter (Web), Git, GitHub und Firebase zu besch??ftigen. Hast du die zugeh??rigen Challenges gemeistert bist du sicher bereit, aktiv ??ber unser GitHub Repository an MyProjects mitzuarbeiten und aktiv neue Features f??r MyProjects zu entwickeln die du noch vermisst.\n\nMach MyProjects zu deinem Projekt! Wir w??rden uns freuen.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: height * 0.025),
                      TextButton(
                          //link to github repository
                          child: Text(
                            'https://github.com/SetNameHere/MyProjects-2021',
                            style: TextStyle(
                              fontSize: 20,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                          onPressed: () => launch(
                              'https://github.com/SetNameHere/MyProjects-2021')),
                      SizedBox(height: height * 0.03),
                      Text(
                        'Themenfelder',
                        style: TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/under-construction');
                          },
                          child: Text('Thema hinzuf??gen')),
                      SizedBox(height: height * 0.01),
                      //In the following there is a list of cards for learning themes are defined
                      FutureBuilder(
                        // Initialize FlutterFire:
                        future: _learningThemes,
                        builder: (context, snapshot) {
                          // Check for errors
                          if (snapshot.hasError) {
                            return Center(
                                child: Text(
                                    'Sorry, die Lernthemen konnten leider nicht geladen werden.'));
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
                                      title: Column(
                                        children: [
                                          Text(
                                            snapshot.data[index].theme,
                                            style: TextStyle(
                                                fontSize: 20,
                                                // decoration: TextDecoration.underline,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          Text('Tags: ' +
                                              snapshot.data[index].tags
                                                  .toString())
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                      children: [
                                        SizedBox(height: 10),
                                        Text(snapshot
                                            .data[index].shortDescription),
                                        SizedBox(height: 10),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ChallengesScreen(
                                                              snapshot.data[
                                                                  index])));
                                            },
                                            child: Text('Zu den Challenges')),
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
            SizedBox(height: height * 0.05), //insert empty space at the bottom
            Impressum(),
          ],
        )),
      ),
    );
  }
}

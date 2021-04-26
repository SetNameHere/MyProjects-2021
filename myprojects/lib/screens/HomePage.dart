import 'package:flutter/material.dart';
import 'package:myprojects/Extensions/DrawerContent.dart';
import 'package:myprojects/screens/ExampleProfil.dart';
import 'package:myprojects/screens/Impressum.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
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
            SizedBox(
              height: height * 0.6,
              width: screenSize.width,
              child: Image.asset(
                //insert a picture
                'images/ProjektCollage.png',
              ),
            ),
            SizedBox(
              //insert an empty space under the picture
              height: height * 0.07,
            ),
            SizedBox(
              child: TextField(
                //insert a textfield as a searchbar
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                  labelText: 'Suche nach Projekten, Lernpfaden, Personen, ...',
                ),
                onSubmitted: (String value) {
                  //when the user submittes his search request, route to a new page
                  Navigator.pushNamed(context, '/under-construction');
                },
              ),
              width: screenSize.width * 0.5,
            ),
            SizedBox(
              //insert an empty space under the picture
              height: height * 0.07,
            ),
            Container(
                //new container for text.
                width: screenSize.width - rahmen,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Verbesserung durch Projekte!',
                        style: TextStyle(
                          fontSize: 35,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Text(
                        'Kaum etwas fördert so nachhaltig den Erwerb von Kompetenzen wie das selbstständige Lösen einer Aufgabenstellung, also das Bearbeiten von Projekten.\n\nAuch bei der Suche nach einer neuen beruflichen Herausforderung ist wenig so überzeugend für den potenziellen neuen Arbeit-/Auftragsgeber wie bereits erfolgreich bewerkstelligte ähnliche Projekte.\n\nDoch oftmals fehlt die Inspiration, welche Projekte hinsichtlich der eigenen Interessen und Karrierewünsche zielführend sind und noch viel schlimmer ist, dass viele Projekte nach kurzer Zeit unsichtbar in einer Schublade verschwinden.\n\nDem soll MyProjects künftig entgegenwirken. Hier sollst du Challenges finden, die dich motivieren sollen dich in ein Thema einzulernen und die zum Erhalt bestimmter Kompetenzen führen.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                        ),
                      ),
                      TextButton(
                        //link to a example profil
                        child: Text(
                          'hier gehts zu den Lern-Challenges',
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: () => Navigator.pushNamed(
                            context, '/learning-challenges'),
                      ),
                      Text(
                        'Ebenfalls soll es Community-Challenges geben zu denen sich  Teams zusammenfinden können um Lösungen zu entwickeln. Quasi wie durchgängig verfügbare Hackathons.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                        ),
                      ),
                      TextButton(
                        //link to a example profil
                        child: Text(
                          'hier gehts zu den Community-Challenges',
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: () => Navigator.pushNamed(
                            context, '/community-challenges'),
                      ),
                      Text(
                        'Deine Projektergebnisse wirst du dann auf einem persönlichen Profil übersichtlich und detailliert vorstellen können.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                        ),
                      ),
                      TextButton(
                          //link to a example profil
                          child: Text(
                            'Hier ein fühes Beispielprofil',
                            style: TextStyle(
                              fontSize: 20,
                              height: 1.5,
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ExampleProfil()))),
                      Text(
                        'Unter dem Beispielprofil findest du auch noch weitere Hintergrundinformationen zu MyProjects.\n\nDoch damit MyProjects das alles bieten kann brauchen wir dich - und zwar nicht nur als Nutzer.\n\nMyProjects ist komplett Open Source, was bedeutet, dass du es aktiv mitgestalten und selbst programmieren kannst. Nicht nur beim Design von MyProjects gibts noch einiges zu verbessern! Hier geht’s zum GitHub Repository:',
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
                      SizedBox(height: height * 0.025),
                      Text(
                        'Du hast noch keine Ahnung von Git, GitHub, Flutter (Web) oder Firebase, was die Grundlage für MyProjects bildet? Kein Problem! Dann ist das deine erste Challenge. Recherchiere und beschäftige dich mit den  Technologien. Probiere sie aktiv aus. Tutorials gibt es im Internet genug. Insbesondere, falls du später mit der Entwicklung von Software zu tun haben willst, wird sich der Aufwand für dich sicher lohnen!',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                          height:
                              height * 0.05), //insert empty space at the bottom
                    ])),
            Impressum(),
          ],
        )),
      ),
    );
  }
}




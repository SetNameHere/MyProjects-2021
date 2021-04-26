import 'package:flutter/material.dart';
import 'package:myprojects/Extensions/DrawerContent.dart';
import 'package:myprojects/screens/Impressum.dart';
import 'package:url_launcher/url_launcher.dart';

class ExampleProfil extends StatelessWidget {
  const ExampleProfil();

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
                          height: height * 0.2,
                          width: screenSize.width,
                          child: Image.asset(
                            //insert a picture
                            'images/Profil.png',
                          ),
                        ),
                        Text(
                          'Name:',
                          style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text('Maxime Muster'),
                        SizedBox(height: height * 0.01),
                        Text(
                          'Ein Satz der mich beschreibt:',
                          style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                            'Ohne ein schönes Projekt wird mir schnell langweilig!'),
                        SizedBox(height: height * 0.01),
                        Text(
                          'Talente:',
                          style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text('Softwareentwicklung, CAD, Schreinern, Löten.'),
                        SizedBox(height: height * 0.03),
                        Text(
                          'Meine Projekte:',
                          style: TextStyle(
                            fontSize: 35,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Card(
                          color: Colors.grey[100],
                          child: Column(
                            children: [
                              SizedBox(height: height * 0.01),
                              SizedBox(
                                child: Image.asset(
                                  //insert a picture
                                  'images/ProjektCollage.png',
                                ),
                                height: height * 0.1,
                              ),
                              SizedBox(height: height * 0.01),
                              Text(
                                'MyProjects',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              Text(
                                'MyProjects ist eine Plattform für Projekte. Sie soll Nutzer unterstützen neue Projekte anzugehen und dabei Kompetenzen zu erlernen.\nProjekterfolge können außerdem auf einem eigenen Profil veröffentlicht werden.',
                              ),
                              SizedBox(height: height * 0.01),
                              ElevatedButton(
                                  onPressed: () {
                                    launch(
                                        'https://firebasestorage.googleapis.com/v0/b/myprojects-2021.appspot.com/o/MyProjects.pdf?alt=media&token=f4ee4e96-d5cf-4672-8f1d-ee4c4c4d58aa');
                                  },
                                  child: Text('Zur Dokumentation')),
                              SizedBox(height: height * 0.01),
                            ],
                          ),
                        )
                      ])),
              Expanded(child: SizedBox()),
              Impressum(),
            ],
          ),
        ));
  }
}

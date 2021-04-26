import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Impressum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height - kToolbarHeight;
    double rahmen = screenSize.width * 0.1;
    final double width = screenSize.width - rahmen * 2;

    return Container(
        color: Colors.grey[600],
        //height: height * 0.15,
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: width * 0.1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.025,
                  ),
                  SizedBox(
                    child: Text(
                        'MyProjects erfasst mit dieser Seite aktuell keine Daten von dir. Zur Bereitstellung der Seite kann es jedoch sein, dass unser Hosting-Provider Daten wie deine IP-Adresse erfasst, um den Dienst bereitstellen zu können. Mehr Informationen hierzu findest du hier:',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    width: width * 0.8,
                  ),
                  TextButton(
                      onPressed: () =>
                          launch('https://firebase.google.com/support/privacy'),
                      child: Text('https://firebase.google.com/support/privacy',
                          style: TextStyle(
                            color: Colors.blue[400],
                            decoration: TextDecoration.underline,
                          ))),
                  TextButton(
                      onPressed: () => showAboutDialog(
                              context: context,
                              applicationName: 'Impressum MyProjects',
                              children: [
                                Text(
                                    'MyProjects \n\nVertreten durch Felix Maag\n\nBitte beachten: Diese Webseite ist lediglich ein Prototyp und dient in keinem Fall zum aktuellen Zeitpunkt geschäftlichen Interessen/Zwecken.'),
                                SizedBox(
                                  height: height * 0.035,
                                ),
                                Text(
                                    'E-Mail: tracetid2018@gmail.com'),
                                SizedBox(
                                  height: height * 0.035,
                                ),
                              ]),
                      child: Text(
                        'Impressum',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}

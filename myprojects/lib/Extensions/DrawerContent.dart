import 'package:flutter/material.dart';



class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
              ListTile(
              //button for routing to Lerningpaths subpage
              onTap: () => Navigator.pushNamed(context,
                  '/community-challenges'), //when button is tapped, user is routed to this subpage
              title: Text(
                'Community - Challenges',
              )),
        ],
      );
  }
}
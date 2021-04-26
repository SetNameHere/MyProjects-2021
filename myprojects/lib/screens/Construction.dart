import 'package:flutter/material.dart';
import 'package:myprojects/Extensions/DrawerContent.dart';
import 'package:myprojects/screens/Impressum.dart';
import 'package:url_launcher/url_launcher.dart';

class Construction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final double height = screenSize.height - kToolbarHeight;
    return Scaffold(
      endDrawer: Drawer(
          child: DrawerContent()),
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: Row(children: <Widget>[
          TextButton(
            child: const Text(
              'MyProjects',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pushNamed(context, '/Home'),
          )
        ]),
      ),
      body: Container(
        
          color: Colors.white,
          child: SingleChildScrollView(
              child: Center(
                  child: Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              SizedBox(
                height: height * 0.7,
                child: Image.asset(
                  'images/under-construction.jpg',
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text('Hilf mit unter:', style: TextStyle(fontSize: 20)),
              TextButton(
                  child: Text(
                    'https://github.com/SetNameHere/MyProjects',
                    style: TextStyle(
                      fontSize: 20,
                      height: 1.5,
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                  onPressed: () => launch(
                      'https://github.com/SetNameHere/MyProjects')),
              SizedBox(height: height * 0.05),
              Impressum()
            ],
          )))),
    );
  }
}

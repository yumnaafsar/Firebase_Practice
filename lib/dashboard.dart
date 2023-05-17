
import 'package:firebase_app/services/authentication.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  AuthenticationService _auth= AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(onPressed: null, 
          child:Icon(Icons.edit,
          color: Colors.white,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.cyan),
          ),
          ),

          ElevatedButton(
          child:Icon(Icons.exit_to_app,
          color: Colors.white,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.cyan),
          ),
          onPressed: ()async 
          {
            await _auth.signOut().then((result) => {
              Navigator.of(context).pop(true),
            });
          },
          )

        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text('yumna'),
                subtitle: Text('This is a firebase project'),
              ),
            );
          },
        ),
      ),
    );
  }
}
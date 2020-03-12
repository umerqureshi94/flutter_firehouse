import 'package:flutter/material.dart';
import 'Auth.dart';
// ignore: camel_case_types
class home_page extends StatelessWidget {
  // This widget is the root of your application.
  home_page({
    this.auth,
    this.onSignOut, this.title
  });
  final String title;
  final AuthImplementation auth;
  final VoidCallback onSignOut;
  void logout()async {
    try{
      await auth.signOut();
      onSignOut();

    }
    catch(e){
      print("error "+ e);

    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:Text("home page"),
        actions: <Widget>[
          FlatButton(
            child: Text("logout"),
            onPressed: logout,
          )
        ],
      ),
      body: Container(

      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepOrange,
        child: Container(
          child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.home,
                    ),
                    onPressed: () {}),
                IconButton(
                  icon: Icon(
                    Icons.account_circle,
                  ),
                  onPressed:(){},
                )]),
        ),
      ),
    );
  }
}
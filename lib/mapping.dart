import 'package:flutter/material.dart';
import 'Auth.dart';
import 'loginRegisterpage.dart';

//import 'Auth.dart';
import 'home_page.dart';


class mapping_pageState extends StatefulWidget{
  final  AuthImplementation  auth;

  mapping_pageState({
    this.auth
  });
  State<StatefulWidget> createState(){
    return _MappingPageState();
  }

}
enum AuthStatus{
  notSignedIn,
  signedIn,

}
class _MappingPageState extends State<mapping_pageState>{
  AuthStatus authStatus = AuthStatus.notSignedIn;
  @override
  void initState(){
    super.initState();
    widget.auth.getCurrentUser().then((firebaseuserId)
    {
      setState(() {
        authStatus = firebaseuserId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });

  }
// ignore: non_constant_identifier_names
  void _SignedIn()
  {
    setState(() {
      authStatus=AuthStatus.signedIn;
    });

  }
  // ignore: non_constant_identifier_names
  void _SignedOut()
  {
    setState(() {
      authStatus=AuthStatus.notSignedIn;
    });

  }







  @override
  Widget build(BuildContext context) {

    switch(authStatus){
      case AuthStatus.notSignedIn:
        return loginRegisterPage(
          auth:widget.auth,
          onSignIn: _SignedIn,
        );
      case AuthStatus.signedIn:
        return home_page(
          auth:widget.auth,
          onSignOut: _SignedOut,
        );
    }



    return null;
  }
}

import 'package:flutter/material.dart';
import 'Auth.dart';






class loginRegisterPage extends StatefulWidget{
  loginRegisterPage({
    this.auth,
    this.onSignIn, this.title
  });
  final String title;
  final AuthImplementation auth;
  final VoidCallback onSignIn;
  @override
  _loginRegisterpageState createState() => _loginRegisterpageState();



}

enum FormType{

  login,register

}

class  _loginRegisterpageState extends State<loginRegisterPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final  formkey=new  GlobalKey<FormState>();
  FormType _formType= FormType.login;
  String _email="";
  String _password="";
  bool validateandsave (){
    final form= formkey.currentState;
    if(form.validate())
    {
      form.save();
      return true;
    }
    else{
      return false;
    }
  }
  void validateAndSubmit() async{
    if(validateandsave()){
      try{
        if(_formType==FormType.login){
          String userId = await widget.auth.SignIn(_email, _password);
          print("login user id="+ userId);
        }else{
          String userId = await widget.auth.SignUp(_email, _password);
          print("Reister  user id="+ userId);
        }
        widget.onSignIn();
      }
      catch(e){
        print("error="+ e.toString());
      }
    }
  }


  void moveToregister(){
    formkey.currentState.reset();
    setState(() {
      _formType= FormType.register;
    });
  }
  void moveTologin(){
    formkey.currentState.reset();
    setState(() {
      _formType= FormType.login;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("firebase demo"),
      ),
      body: Container(
        margin: EdgeInsets.all(25.0),
        child: Form(key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:Inputfields()+CreateButton(),
            )),
      ),

    );
  }
// ignore: non_constant_identifier_names
  List <Widget> CreateButton(){
    {
      if(_formType ==FormType.login) {
        return
          [Padding(padding: const EdgeInsets.only(left: 4, right: 4, top: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                onPressed: validateAndSubmit,
                child: Text(
                  'LOGIN',

                ),
                color: Colors.red,
              ),
            ),),
            Padding(padding: const EdgeInsets.only(left: 4, right: 4, top: 10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: moveToregister,
                  child: Text(
                    'create and account ',

                  ),
                  color: Colors.red,
                ),
              ),)
          ];
      }
      else{
        return
          [Padding(padding: const EdgeInsets.only(left: 4, right: 4, top: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                onPressed: validateAndSubmit,
                child: Text(
                  'Register',

                ),
                color: Colors.red,
              ),
            ),),
            Padding(padding: const EdgeInsets.only(left: 4, right: 4, top: 10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: moveTologin,
                  child: Text(
                    'i have already an account',

                  ),
                  color: Colors.red,
                ),
              ),),
          ];

      }

    }

  }

  // ignore: non_constant_identifier_names
  List <Widget> Inputfields(){
    {
      return[
        SizedBox(),
        TextFormField(
            decoration: InputDecoration(
              hintText: 'email',
              labelText: 'email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.account_circle),
              contentPadding: const EdgeInsets.all(10.0),),
            validator: (value){
              return value.isEmpty ? 'Email is must Required' : null;
            },
            onSaved: (value){
              return _email=value;
            }

        ),
        TextFormField(
            decoration: InputDecoration(
              hintText: 'password',
              labelText: 'password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.account_circle),
              contentPadding: const EdgeInsets.all(10.0),),
            validator: (value){
              return value.isEmpty ? 'password is must Required' : null;
            },
            onSaved: (value){
              return _password=value;
            }),


      ];
    }

  }



}
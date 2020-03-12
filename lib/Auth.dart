import 'package:firebase_auth/firebase_auth.dart';


abstract class  AuthImplementation
{
  //abstarct methos
  Future <String> SignIn(String _email,String _password);
  Future <String> SignUp(String _email,String _password);
  Future <void> signOut();
  Future<String> getCurrentUser();
}
class Auth implements AuthImplementation
{
  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
  Future <String> SignIn(String _email,String _password) async
  {
    FirebaseUser user= (await _firebaseAuth.signInWithEmailAndPassword(email: _email, password: _password));
    return user.uid;

  }
  Future <String> SignUp(String _email,String _password) async
  {
    FirebaseUser user= (await _firebaseAuth.createUserWithEmailAndPassword(email: _email, password: _password));
    return user.uid;
  }
  Future <void> signOut() async{
    _firebaseAuth.signOut();
  }
  Future<String> getCurrentUser() async{
    FirebaseUser user= await _firebaseAuth.currentUser();
    return user.uid;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:newchatpro/screens/chat_screen.dart';

import '../components/Button.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id="login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String pass;
  final _auth=FirebaseAuth.instance;
  bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          Flexible(
          child: Hero(tag: 'logo', child:  Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),)),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.

                    email=value;

                },
                decoration:KInputDecoration.copyWith(hintText: "Enter your email")
                ,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,

                onChanged: (value) {
                  //Do something with the user input.
                  pass=value;
                },
                decoration:  KInputDecoration.copyWith(hintText: "Enter your password")
          ,
              ),
              SizedBox(
                height: 24.0,
              ),

              ButtonWidget(color: Colors.lightBlueAccent,text:  'Log In',onPressed: ()async{
              try{ setState(() {
                  showSpinner=true;
                });
                if(email!=null && pass!=null){
                final user= await _auth.signInWithEmailAndPassword(email: email, password: pass);
               print(user);
                if(user!=null){
                  Navigator.pushNamed(context, ChatScreen.id);
                }
                setState(() {
                  showSpinner=false;
                });
                }}catch(e){
                print(e);
              }


              }),


            ],
          ),
        ),
      ),
    );
  }
}

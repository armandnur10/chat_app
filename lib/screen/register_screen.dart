import 'dart:math';

import 'package:chat_app/screen/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'REGISTER_SCREEN';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset('images/logo.png'),
                ),
                const SizedBox(
                  height: 48,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                  onChanged: (newValue) {
                    email = newValue;
                  },
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Enter Your Email',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2)
                  ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                  onChanged: (newValue) {
                    email = newValue;
                  },
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Enter Your Password',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(32),
                      ),
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2)
                  ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                  ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Material(
                      color: Colors.lightBlueAccent,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      elevation: 5,
                      child: MaterialButton(
                        onPressed: ()async{
                          setState(() {
                            showSpinner = true;
                          });
                          try{
                            await _auth.createUserWithEmailAndPassword(email: email, password: password);
                            print('login');
                            Navigator.pushReplacementNamed(context, ChatScreen.id);
                            setState(() {
                              showSpinner = false;
                            });
                          }catch(e){
                            print(e);
                          }
                      },
                      minWidth: 200,
                      height: 42,
                      child: const Text('Register'),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ));
  }
}

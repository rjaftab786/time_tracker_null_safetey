import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:time_tracker/app/email_sign_in_page.dart';
import 'package:time_tracker/services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key, required this.auth}) : super(key: key);
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: _buildContext(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContext(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 50,
            child: SignInButton(Buttons.Google,
                text: "Sign in with Google", onPressed: _signInWithGoogle),
          ),
          SizedBox(
            height: 8.0,
          ),
          SizedBox(
            height: 50,
            child: SignInButton(
              Buttons.Facebook,
              text: "Sign in with Facebook",
              onPressed: _signInWithFacebook,
            ),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 50,
            child: SignInButtonBuilder(
              backgroundColor: Colors.teal.shade700,
              icon: Icons.email,
              text: 'Sign in with email',
              onPressed: () => _signInWithEmail(context),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'or',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 50,
            child: SignInButtonBuilder(
              icon: Icons.contactless,
              iconColor: Colors.black,
              backgroundColor: Colors.lime.shade300,
              text: 'Go anonymous',
              textColor: Colors.black,
              onPressed: _signInAnonymously,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        elevation: 2.0,
      ),
      body: _buildContext(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContext() {
    return Container();
  }
}

//import 'dart:html';

import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login to your account",
        ),
      ),
      body: ListView(
        children: <Widget>[
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Text(
            "In order to use editing and rating capabilities of TMDb, as well  as get personal recommendations you will need to login to your account. If you do not have an account. registering for an account is free and simple. ",
            style: textStyle,
          ),
          TextButton(
            onPressed: () {},
            child: Text("Click here to get started"),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "If you signed up but didn't get your verification email.",
            style: textStyle,
          ),
          TextButton(
            onPressed: () {},
            child: Text("Click here to have it resent"),
          ),
          _FormWidget(),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  String? errorText = null;
  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == "admin" && password == "admin") {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      errorText = "Неверный логин или пароль";

      setState(() {});
    }
  }

  void _resetPassword() {
    print("reset password");
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black87,
    );
    final color = const Color(0xFF01B4E4);
    final textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: TextStyle(fontSize: 17, color: Colors.red),
          ),
          SizedBox(
            height: 20,
          ),
        ],
        Text(
          "Username",
          style: textStyle,
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecoration,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Password",
          style: textStyle,
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecoration,
          obscureText: true,
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color)),
              onPressed: _auth,
              child: Text("Login"),
            ),
            SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: _resetPassword,
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  TextStyle(color: color),
                ),
              ),
              child: Text("Reset password"),
            ),
          ],
        ),
      ],
    );
  }
}

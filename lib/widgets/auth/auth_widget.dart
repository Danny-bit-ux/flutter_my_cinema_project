//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_tmdb/widgets/auth/auth_model.dart';
import 'package:provider/provider.dart';

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
          _FormWidget(),
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
        ],
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.read(context)?.model;
    const textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.black87,
    );

    const textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      isCollapsed: true,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ErrorMessageWidget(),
        const Text(
          "Username",
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: model?.loginTextController,
          decoration: textFieldDecoration,
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Password",
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: model?.passwordTextController,
          decoration: textFieldDecoration,
          obscureText: true,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const _AuthButtonWidget(),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  TextStyle(color: Colors.white),
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

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.watch(context)?.model;
    const color = const Color(0xFF01B4E4);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthProgress == true
        ? const SizedBox(
            width: 15, height: 15, child: CircularProgressIndicator())
        : const Text('Login');
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
      onPressed: onPressed,
      child: child,
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = AuthProvider.watch(context)?.model.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Text(
        errorMessage,
        style: TextStyle(fontSize: 17, color: Colors.red),
      ),
    );
  }
}

import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagrame_clone/util/colours.dart';
import 'package:instagrame_clone/widget/text_field_input.dart';

class login_screen_layout extends StatefulWidget {
  const login_screen_layout({
    Key? key,
  }) : super(key: key);

  @override
  _login_screen_layoutState createState() => _login_screen_layoutState();
}

class _login_screen_layoutState extends State<login_screen_layout> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(),
            flex: 2,
          ),
          //png image
          Image.asset(
            'assets/images/instagram.png',
            color: primaryColor,
            height: 200,
          ),
          //text field for email
          const SizedBox(
            height: 64,
          ),
          TextFieldInput(
            hintText: 'Enter your Email ',
            textInputType: TextInputType.emailAddress,
            textEditingController: _emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          //text field for password
          TextFieldInput(
            hintText: 'Enter your Password ',
            textInputType: TextInputType.emailAddress,
            textEditingController: _passwordController,
            isPass: true,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              child: const Text('Log in'),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  color: blueColor),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Container(),
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: const Text("Don't have an account?"),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                ),
              ),
              Container(
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
              ),
            ],
          )

          //log in button
          //transition for signin
        ],
      ),
    )));
  }
}

import 'dart:ffi';
import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagrame_clone/resources/auth_methods.dart';
import 'package:instagrame_clone/util/colours.dart';
import 'package:instagrame_clone/widget/text_field_input.dart';

class signup_screen_layout extends StatefulWidget {
  const signup_screen_layout({
    Key? key,
  }) : super(key: key);

  @override
  _signup_screen_layoutState createState() => _signup_screen_layoutState();
}

class _signup_screen_layoutState extends State<signup_screen_layout> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
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
            height: 100,
          ),
          // field for image
          Stack(
            children: [
              CircleAvatar(
                  radius: 48,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1658985416927-df333ede5b2b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')),
              Positioned(
                  bottom: -10,
                  left: 200,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo),
                  ))
            ],
          ),
          //text field for email
          const SizedBox(
            height: 20,
          ),

          //text field for username
          TextFieldInput(
            hintText: 'Enter your username ',
            textInputType: TextInputType.text,
            textEditingController: _usernameController,
          ),
          const SizedBox(
            height: 10,
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
          //text field for bio
          TextFieldInput(
            hintText: 'Enter your information ',
            textInputType: TextInputType.text,
            textEditingController: _bioController,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              String res = await AuthMethods().SignUpUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _usernameController.text,
                  bio: _bioController.text);
            },
            child: Container(
              child: const Text('Sign Up'),
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
/*          Row(
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
          )*/

          //log in button
          //transition for signin
        ],
      ),
    )));
  }
}

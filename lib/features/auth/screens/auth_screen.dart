

import 'package:amazon_clone/commons/widgets/custom_button.dart';
import 'package:amazon_clone/commons/widgets/custom_text_field.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final _signinformKey = GlobalKey<FormState>();
  final _signupformKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  Auth _auth = Auth.signup;
  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }
  void signInUser(){
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              SizedBox(
                width: double.infinity,
                child: SegmentedButton(
                  segments: [
                    const ButtonSegment(
                      value: Auth.signup,
                      label: Text("Create Account"),
                    ),
                    const ButtonSegment(
                      value: Auth.signin,
                      label: Text("Sign-In"),
                    ),
                  ],
                  selected: {_auth},
                  onSelectionChanged: (Set newSelection) {
                    setState(() {
                      _auth = newSelection.first;
                    });
                  },
                ),
              ),

              if (_auth == Auth.signup)
                Form(
                  key: _signupformKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        mycontroller: _emailController,
                        hintText: "Email",
                      ),
                      CustomTextField(
                        mycontroller: _passwordController,
                        hintText: "Passowrd",
                      ),
                      CustomTextField(
                        mycontroller: _nameController,
                        hintText: "User",
                      ),
                      CustomButton(
                        text: "Sign-Up",
                        onTap: () {
                          if (_signupformKey.currentState!.validate()) {
                            signUpUser();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              if (_auth == Auth.signin)
                Form(
                  key: _signinformKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        mycontroller: _emailController,
                        hintText: "Email",
                      ),
                      CustomTextField(
                        mycontroller: _passwordController,
                        hintText: "Passowrd",
                      ),
                      CustomButton(text: "Sign-In", onTap: () {
                        if (_signinformKey.currentState!.validate()) {
                            signInUser();
                          }
                      }),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

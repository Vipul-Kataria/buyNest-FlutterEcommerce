import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
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
                child: SegmentedButton<Auth>(
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
                  selected:{_auth},
                  onSelectionChanged: (Set newSelection) {
                    setState(() {
                      _auth = newSelection.first;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:othego_project/screens/sign_in.dart';
import 'package:othego_project/screens/sign_up.dart';
import 'package:othego_project/widgets/custom_scaffold.dart';
import 'package:othego_project/widgets/welcome_buttons.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 8,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40.0,
              ),
              child: Center(
                  child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(children: [
                  TextSpan(
                      text: 'Welcome Back!\n',
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w600,
                      )),
                  TextSpan(
                      text: 'Enter personal details to connect with us',
                      style: TextStyle(
                        fontSize: 20,
                      ))
                ]),
              )),
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: WelcomeButtons(
                      buttonText: 'Sign in',
                      onTap: SignIn(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButtons(
                      buttonText: 'Sign up',
                      onTap: SignUp(),
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

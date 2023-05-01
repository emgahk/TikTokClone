import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // print(Localizations.localeOf(context));
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          bottomNavigationBar: Container(
            color: isDarkMode(context) ? null : Colors.grey.shade50,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: Sizes.size32, bottom: Sizes.size64),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: Sizes.size16),
                  ),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: Sizes.size16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
                child: Column(
                  children: [
                    Gaps.v80,
                    const Text('sign up to TikTok',
                        style: TextStyle(
                            fontSize: Sizes.size24,
                            fontWeight: FontWeight.w700)),
                    Gaps.v20,
                    Text(
                      'Create a profile, follow other accounts, make your own videos, and more.',
                      style: TextStyle(
                          fontSize: Sizes.size16,
                          color: isDarkMode(context)
                              ? Colors.grey.shade300
                              : Colors.black45),
                      textAlign: TextAlign.center,
                    ),
                    Gaps.v40,
                    if (orientation == Orientation.portrait) ...[
                      GestureDetector(
                        child: const AuthButton(
                            fucName: UsernameScreen(),
                            icon: FaIcon(FontAwesomeIcons.user),
                            text: 'Use Phone & email'),
                      ),
                      Gaps.v16,
                      const AuthButton(
                          icon: FaIcon(FontAwesomeIcons.apple),
                          text: 'Continue with Apple')
                    ],
                    if (orientation == Orientation.landscape)
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              child: const AuthButton(
                                  fucName: UsernameScreen(),
                                  icon: FaIcon(FontAwesomeIcons.user),
                                  text: 'Use Phone & email'),
                            ),
                          ),
                          Gaps.h16,
                          const Expanded(
                            child: AuthButton(
                                icon: FaIcon(FontAwesomeIcons.apple),
                                text: 'Continue with Apple'),
                          )
                        ],
                      )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

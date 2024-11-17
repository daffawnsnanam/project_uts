import 'package:flutter/material.dart';
import 'package:spotify/constants/colors.dart';
import 'package:spotify/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(text: 'UTB@gmail.com');
  final TextEditingController passwordController = TextEditingController(text: 'UTB');
  bool rememberMe = false;

  // Email and password for validation
  final String validEmail = 'UTB@gmail.com';
  final String validPassword = 'UTB';

  void _validateLogin() {
    String email = emailController.text;
    String password = passwordController.text;

    if (email != validEmail && password != validPassword) {
      _showErrorDialog('Email & Password salah');
    } else if (email != validEmail) {
      _showErrorDialog('Email salah');
    } else if (password != validPassword) {
      _showErrorDialog('Password salah');
    } else {
      // Navigate to Home Page if credentials are correct
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Container(
                height: height / 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstants.primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Millions of songs, free on Spotify',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 300.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Login Account',
                          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 22),
                        Input(
                          controller: emailController,
                          hint: 'Email or Username',
                          icon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 16),
                        Input(
                          controller: passwordController,
                          hint: 'Password',
                          icon: Icons.visibility_outlined,
                          obscureText: true,
                        ),
                        SwitchListTile.adaptive(
                          activeColor: ColorConstants.primaryColor,
                          value: rememberMe,
                          onChanged: (bool value) {
                            setState(() {
                              rememberMe = value;
                            });
                          },
                          contentPadding: const EdgeInsets.all(0),
                          title: Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.starterWhite,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _validateLogin,
                          child: const Text('Login'),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                height: 1,
                                color: ColorConstants.starterWhite,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'or',
                              style: TextStyle(
                                color: ColorConstants.starterWhite,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                height: 1,
                                color: ColorConstants.starterWhite,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              child: Image.asset('assets/images/google.png'),
                            ),
                            const SizedBox(width: 16),
                            SizedBox(
                              height: 40,
                              child: Image.asset('assets/images/facebook.png'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Forget password?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.starterWhite,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Sign up now',
                        style: TextStyle(
                          color: ColorConstants.primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(color: ColorConstants.starterWhite),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(26)),
        ),
        suffixIcon: Icon(icon, color: ColorConstants.starterWhite),
      ),
    );
  }
}

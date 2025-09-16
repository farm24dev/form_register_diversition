import 'package:flutter/material.dart';
import 'package:form_register_diversition/constants/colours.dart';
import 'package:form_register_diversition/presentations/auth/register/pages/register_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.white,
      body: Center(
        child: Center(child: Image.asset('assets/images/img_logo.png', height: 70)),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/screens/home_page.dart';
import 'package:note_app/screens/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void _ifStartedBefore() async {
    final prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    final ifStarted = prefs.getBool('isStarted') ?? false;
    if (mounted) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              (ifStarted) ? const HomePage() : const OnboardingPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    _ifStartedBefore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/lottie/note_animation.json',
            width: 150, animate: false),
      ),
    );
  }
}

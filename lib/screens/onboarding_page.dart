import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/screens/home_page.dart';
import 'package:note_app/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  void _saveIfStartTed() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isStarted', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            DelayedDisplay(
                delay: const Duration(milliseconds: 100),
                child: Lottie.asset('assets/lottie/note_animation.json')),
            const DelayedDisplay(
              delay: Duration(milliseconds: 500),
              child: Text(
                'Simplement prendre une note',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const DelayedDisplay(
              delay: Duration(milliseconds: 300),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            DelayedDisplay(
              delay: const Duration(milliseconds: 600),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      elevation: 0,
                      minimumSize: const Size(double.infinity, 45)),
                  onPressed: () {
                    _saveIfStartTed();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Commencer',
                    style: TextStyle(fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

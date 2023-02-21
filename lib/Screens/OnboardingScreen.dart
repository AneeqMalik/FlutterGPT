import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  void initialize() async {
    await Future.delayed(Duration(seconds: 5));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Head Text
          SizedBox(
            height: 100,
          ),
          Column(
            children: [
              const Text(
                "Your AI Assistant",
                style: TextStyle(
                    color: const Color(0xFF2E6CFF),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                  width: 250,
                  margin: const EdgeInsets.only(top: 30, bottom: 60),
                  child: Text(
                    "Using this software,you can ask you questions and receive articles using artificial intelligence assistant.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600),
                  )),
            ],
          ),
          //Image
          Center(
              child: Container(
                  margin: EdgeInsets.only(bottom: 70),
                  child: Image.asset(
                    "images/onboard.png",
                    color: const Color(0xFF2E6CFF),
                  ))),
          //Button
          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  backgroundColor: const Color(0xFF2E6CFF),
                  fixedSize: Size(300, 50)),
              onPressed: () {},
              child: Row(children: [
                Container(
                  margin: EdgeInsets.only(left: 105),
                  child: Text("Continue"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 80),
                  child: Icon(Icons.arrow_forward),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}

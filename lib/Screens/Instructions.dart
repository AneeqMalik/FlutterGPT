import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Instruction extends StatefulWidget {
  const Instruction({super.key});

  @override
  State<Instruction> createState() => _InstructionState();
}

class _InstructionState extends State<Instruction> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 10),
                child: Center(
              child: Image.asset("images/explain.png"),
            )),
            Container(
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0XFFF5F4F6)),
              child: Center(
                  child: Text(
                "Explain Quantum physics",
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0XFFF5F4F6)),
              child: Center(
                  child: Text(
                "What are wormholes explain like i am 5",
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 10),
                child: Center(
              child: Image.asset("images/write.png"),
            )),
            Container(
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0XFFF5F4F6)),
              child: Center(
                  child: Text(
                "Write a tweet about global warming",
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0XFFF5F4F6)),
              child: Center(
                  child: Text(
                "Write a poem about flower and love",
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0XFFF5F4F6)),
              child: Center(
                  child: Text(
                "Write a rap song lyrics about",
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 10),
                child: Center(
              child: Image.asset("images/translate.png"),
            )),
            Container(
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0XFFF5F4F6)),
              child: Center(
                  child: Text(
                "How do you say \"how are you\" in punjanbi? ",
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0XFFF5F4F6)),
              child: Center(
                  child: Text(
                "Write a poem about flower and love",
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0XFFF5F4F6)),
              child: Center(
                  child: Text(
                "Write an essay on Kashmir Banay Ga Pakistan!",
                textAlign: TextAlign.center,
              )),
            ),
            
          ],
        )),
      ],
    );
  }
}

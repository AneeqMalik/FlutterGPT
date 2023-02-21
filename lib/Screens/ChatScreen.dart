import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      toolbarHeight: 80,
      elevation: 1,
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.volume_up_outlined),
          color: Colors.black87,
        ),
        IconButton(
          onPressed: (() {}),
          icon: Icon(Icons.power_settings_new_sharp),
          color: Colors.grey.shade200,
        ),
        const SizedBox(
          width: 10,
        )
      ],
      leading: Container(
        child: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
          color: const Color(0xFF2E6CFF),
        ),
      ),
      titleSpacing: 0,
      title: Row(children: [
        Container(
            child: Image.asset(
          "images/bot_image.png",
        )),
        Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "ChatGPT",
                  style: TextStyle(color: Color.fromARGB(255, 78, 120, 247)),
                ),
              ),
              Container(
                child: Image.asset("images/status.png"),
                margin: EdgeInsets.only(right: 15),
              )
            ],
          ),
        )
      ]),
    ));
  }
}

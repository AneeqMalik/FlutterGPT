import 'package:chatgpt_clone/Screens/Instructions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model.dart';

const backgroundColor = Color(0xff343541);
const botBackgroundColor = Color.fromARGB(255, 84, 68, 84);

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

Future<String> generateResponse(String prompt) async {
  const apiKey = 'Your OPENAI KEY';

  var url = Uri.https("api.openai.com", "/v1/completions");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $apiKey"
    },
    body: json.encode({
      "model": "text-davinci-003",
      "prompt": prompt,
      'temperature': 0,
      'max_tokens': 100,
      'top_p': 1,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,
    }),
  );

  // Do something with the response
  Map<String, dynamic> newresponse = jsonDecode(response.body);

  return newresponse['choices'][0]['text'];
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  late bool isLoading;
  bool landing = true;
  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

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
            icon: Image.asset(
              "images/volume.png",
            ),
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
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
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
      ),
      backgroundColor: Colors.white,
      body: landing
          ? Column(
              children: [
                Expanded(child: Instruction()),
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        backgroundColor: const Color(0xFF2E6CFF),
                        fixedSize: Size(300, 50)),
                    onPressed: () {
                      setState(() {
                        landing = false;
                      });
                    },
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.only(left: 90),
                        child: Text("Start Using 😊"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60),
                        child: Icon(Icons.arrow_forward),
                      )
                    ]),
                  ),
                )
              ],
            )
          : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: _buildList(),
                  ),
                  Visibility(
                    visible: isLoading,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                        color: Color(0xFF2E6CFF),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        _buildInput(),
                        _buildSubmit(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: Container(
        color: Colors.white,
        child: IconButton(
          icon: const Icon(
            Icons.send_rounded,
            color: Color(0xFF2E6CFF),
          ),
          onPressed: () async {
            setState(
              () {
                _messages.add(
                  ChatMessage(
                    text: _textController.text,
                    chatMessageType: ChatMessageType.user,
                  ),
                );
                isLoading = true;
              },
            );
            var input = _textController.text;
            _textController.clear();
            Future.delayed(const Duration(milliseconds: 50))
                .then((_) => _scrollDown());
            generateResponse(input).then((value) {
              setState(() {
                isLoading = false;
                _messages.add(
                  ChatMessage(
                    text: value,
                    chatMessageType: ChatMessageType.bot,
                  ),
                );
              });
            });
            _textController.clear();
            Future.delayed(const Duration(milliseconds: 50))
                .then((_) => _scrollDown());
          },
        ),
      ),
    );
  }

  Expanded _buildInput() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(color: Color(0xFF2E6CFF)),
        controller: _textController,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Color(0xFF2E6CFF),
                width: 2,
              )),
        ),
      ),
    );
  }

  ListView _buildList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        var message = _messages[index];
        return ChatMessageWidget(
          text: message.text,
          chatMessageType: message.chatMessageType,
        );
      },
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget(
      {super.key, required this.text, required this.chatMessageType});

  final String text;
  final ChatMessageType chatMessageType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: chatMessageType == ChatMessageType.bot
            ? Color(0XFFF5F4F6)
            : Color(0xFF2E6CFF),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          chatMessageType == ChatMessageType.bot
              ? Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'images/bot_image.png',
                      scale: 1.5,
                    ),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: const CircleAvatar(
                    child: Icon(
                      Icons.person_outline_rounded,
                    ),
                  ),
                ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: chatMessageType == ChatMessageType.bot
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

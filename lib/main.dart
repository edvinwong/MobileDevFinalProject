import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobilefinalproject/createpostspage.dart';
import 'package:mobilefinalproject/postdetails.dart';
// import 'package:mobilefinalproject/postdisplaypage.dart';
import 'package:mobilefinalproject/postspage.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final channel =
      IOWebSocketChannel.connect('ws://besquare-demo.herokuapp.com');
  String Name = '';

  void login(name) {
    channel.stream.listen((message) {
      final decodedMessage = jsonDecode(message);
      print(decodedMessage);
      setState(() {
        Name = decodedMessage['type'];
      });
      channel.sink.close();
    });

    channel.sink.add('{"type": "sign_in", "data": {"name": "$name"}}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 10),
                child: Image.asset('besquare_logo.png')),
            Text('User name:'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a user name',
              ),
              // onChanged: (String? value) {
              //   setState(() {
              //     Name = value!;
              //   });
              // },
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                // Navigator.of(context).pushNamed('/postspage');
                login(Name);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PostsPage()),
                );
              },
              child: Text('Enter to the app'),
            )
          ],
        ),
      ),
    );
  }
}

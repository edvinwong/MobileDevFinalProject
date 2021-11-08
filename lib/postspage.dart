import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobilefinalproject/postdetails.dart';
import 'package:web_socket_channel/io.dart';

import 'createpostspage.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Posts Page"),
        ),
        body: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.lightBlue,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.add_box_rounded),
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CreatePostPage()),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.lightBlue,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.settings),
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PostDetailsPage(
                                                description:
                                                    'Mobile development final projectr',
                                                name: 'Name',
                                                title: 'Flutter Final Project',
                                                url: 'URL',
                                              )),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ]),
              ),
            ])));
  }
}

class PostPage extends StatefulWidget {
  const PostPage({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  State<PostPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PostPage> {
  final channel =
      IOWebSocketChannel.connect('ws://besquare-demo.herokuapp.com');
  List posts = [];
  bool sortType = false;
  dynamic test;

  var _scrollController = ScrollController();
  var _listCount = 15;

  void getPosts() {
    channel.stream.listen((message) {
      final decodedMessage = jsonDecode(message);
      setState(() {
        posts = decodedMessage['data']['posts'];
      });
      // print(posts);
    });

    channel.sink.add('{"type": "get_posts"}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.lightBlue,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.add_box_rounded),
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CreatePostPage()),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.lightBlue,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.settings),
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PostDetailsPage(
                                                description:
                                                    'Mobile development final projectr',
                                                name: 'Name',
                                                title: 'Flutter Final Project',
                                                url: 'URL',
                                              )),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ]),
              ),
            ])),
      ),
    );
  }
}

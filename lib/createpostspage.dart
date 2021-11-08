import 'package:flutter/material.dart';
import 'package:mobilefinalproject/postspage.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts Page"),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: <Widget>[
                      Text('Title'),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Input Field',
                        ),
                      ),
                      Text('Description'),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Input Field',
                        ),
                      ),
                      Text('ImageURL'),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Input Field',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PostsPage()),
                                );
                              },
                              child: Text('Create Post'),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const PostsPage()),
                                );
                              },
                              child: Text('Cancel'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}

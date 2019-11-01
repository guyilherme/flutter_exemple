import 'package:afsesab/app/models/PostModel.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  final String title;
  final PostModel snapshot;

  const PostPage({Key key, this.title = "Post", @required this.snapshot}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      widget.snapshot.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
              ),
              Text(
                widget.snapshot.body
              )
            ],
          )
        ],
      ),
    );
  }
}

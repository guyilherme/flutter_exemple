import 'package:afsesab/app/models/PostModel.dart';
import 'package:afsesab/app/pages/home/home_bloc.dart';
import 'package:afsesab/app/pages/home/home_module.dart';
import 'package:afsesab/app/pages/home/post/post_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var bloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  void initState() {
    bloc.getPosts();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
              child: StreamBuilder<List<PostModel>>(
          stream:bloc.responseOut ,
          builder: (context, snapshot) {

            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()));
            }

            if(snapshot.hasData){
              return Column(
                children: snapshot.data.map((item) => ListTile(
                title: Text(item.title),
                onTap: (){
                  Navigator.push(
                    context,MaterialPageRoute(
                      builder: (context) => PostPage(
                        snapshot: item,
                      )
                    )
                  );
                },
                )
                ).toList(),
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          }
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";
import 'package:social_app/components/custom_drawer.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/screens/comentarios.dart';
import 'package:social_app/services/placeholder_service.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final PlaceholderService _placeholderService = PlaceholderService();
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    _placeholderService.getPosts().then((resp) {
      setState(() {
        _posts = resp;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Feed"),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        drawer: CustomDrawer(),
        body: Container(
          color: Colors.blueAccent,
          child: FutureBuilder(
              future: _placeholderService.getPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Comentarios(snapshot.data[index].id)));
                          },
                          child: Card(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("${_posts[index].title}"),
                                ),
                                Text("${_posts[index].body}")
                              ],
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("Erro");
                }
                return Center(child: CircularProgressIndicator());
              }),
        ));
  }
}

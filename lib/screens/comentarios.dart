import 'package:flutter/material.dart';
import 'package:social_app/models/comments.dart';
import 'package:social_app/services/placeholder_service.dart';

class Comentarios extends StatelessWidget {
  final _placeholderService = PlaceholderService();
  final int postId;

  Comentarios(this.postId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comentários"),
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white70,
          child: FutureBuilder<List<Comments>>(
            future: _placeholderService.getComments(postId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("${snapshot.data[index].name}"),
                            subtitle: Text("${snapshot.data[index].email}"),
                          ),
                          ListTile(
                            title: Text("${snapshot.data[index].body}"),
                          )
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Erro ao buscar os comentários"));
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}

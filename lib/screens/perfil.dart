import 'package:flutter/material.dart';
import 'package:social_app/components/custom_drawer.dart';
import 'package:social_app/models/user.dart';

class Perfil extends StatelessWidget {
  final User user;

  Perfil(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Card(
              margin: EdgeInsets.all(8.0),
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "${user.name}",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Usuario: ${user.name}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Email: ${user.email}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Telefone: ${user.phone}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Site: ${user.website}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              margin: EdgeInsets.all(8.0),
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                    "Endereco",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
                  Text("Rua: ${user.address.street}",
                      style: TextStyle(fontSize: 20)),
                  Text(
                    "Apto: ${user.address.suite}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Cidade: ${user.address.city}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "CEP: ${user.address.zipcode}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

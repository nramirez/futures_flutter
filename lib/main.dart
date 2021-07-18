import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Futures in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Futures in Flutter")),
        body: const Center(
          child: Text(
            "Cargando perfil",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

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
        body: StreamBuilder(
            stream: Macarena().stream,
            builder: (context, snapshot) {
              Widget content = const Text("cargando perfil...");
              print(snapshot.connectionState);

              if (snapshot.connectionState == ConnectionState.waiting) {
                content = const CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                content = Text(
                  snapshot.error.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                );
              }

              if (snapshot.hasData) {
                content = Text(
                  snapshot.data.toString(),
                  style: const TextStyle(fontSize: 20),
                );
              }

              return Center(
                child: content,
              );
            }),
      ),
    );
  }
}

class Macarena {
  Macarena() {
    Timer.periodic(const Duration(seconds: 3), (t) {
      if (t.tick > letras.length) {
        t.cancel();
        _controller.close();
      } else {
        _controller.sink.add(letras.elementAt(t.tick - 1));
      }
    });
  }
  final _controller = StreamController<String>();

  List<String> letras = [
    "Dale a tu cuerpo alegría Macarena",
    "Que tu cuerpo es pa' darle alegría y cosa buena",
    "Dale a tu cuerpo alegría Macarena",
    "Hey Macarena",
  ];

  Stream<String> get stream => _controller.stream;
}

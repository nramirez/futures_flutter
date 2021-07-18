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
        body: FutureBuilder(
            future:
                Future.delayed(const Duration(seconds: 5), () => "Hola Naz"),
            builder: (context, snapshot) {
              Widget content = const Text("cargando perfil...");

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

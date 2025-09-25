import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenida Gissell 💚')),
      body: Center(child: Text('Tu app está viva y lista para compilar')),
    );
  }
}

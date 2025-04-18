import 'package:flutter/material.dart';
import 'package:sen_restau/inscrire.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Inscrire(),
      debugShowCheckedModeBanner: false,
    );
  }
}
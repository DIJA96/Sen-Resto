import 'package:flutter/material.dart';
import 'package:sen_restau/navbar.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navbar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
import 'package:flutter/material.dart';
import 'contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulaire de Contact',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContactFormScreen(),
    );
  }
}
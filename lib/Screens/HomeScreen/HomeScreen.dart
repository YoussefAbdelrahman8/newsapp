import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Template Home Page'),
      ),
      body: const Center(
          child: Text(
            textAlign: TextAlign.center,
            'Welcome Ashaf to ur new Project',
            style: TextStyle(
              fontSize: 50,
            ),
          )),
    );
  }
}

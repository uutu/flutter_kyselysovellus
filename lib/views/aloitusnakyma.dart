import 'package:flutter/material.dart';

class Aloitusnakyma extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final nappi = ElevatedButton(
      child: Text('Kysy kysymys'),
      onPressed: () => Navigator.pushNamed(context, '/kysely')
    );

    return Scaffold(body: nappi);
  }
}
import 'package:flutter/material.dart';

class NoNetwrok extends StatelessWidget {
  const NoNetwrok({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/no_network.jpg'),
                fit: BoxFit.contain)),
      ),
    );
  }
}

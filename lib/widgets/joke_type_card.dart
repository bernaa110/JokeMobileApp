import 'package:flutter/material.dart';

class JokeTypeCard extends StatelessWidget {
  final String jokeType;
  final VoidCallback onTap;

  const JokeTypeCard({super.key, required this.jokeType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.blue.shade100,
        child: Center(
          child: Text(
            jokeType,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

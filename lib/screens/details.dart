import 'package:flutter/material.dart';
import 'package:jokes_app/services/api_service.dart';
import 'package:jokes_app/widgets/joke_card.dart';

class Details extends StatelessWidget {
  final String type;

  const Details({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$type",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true, // Centers the title in the AppBar
        backgroundColor: Colors.blue.shade200, // You can change this color to fit your theme
        elevation: 5,
      ),
      body: FutureBuilder(
        future: ApiService.getJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            var jokes = snapshot.data as List<Map<String, dynamic>>;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                var joke = jokes[index];
                return JokeCard(
                    setup: joke['setup'], punchline: joke['punchline']);
              },
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String image;
  final String language;
  final String genres;
  const DetailScreen(
      {super.key,
      required this.title,
      required this.image,
      required this.language,
      required this.genres});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DETAILS"),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: Image.network(
              image,
            ),
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "Language: " + language,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Text(
            "Genres: " + genres,
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

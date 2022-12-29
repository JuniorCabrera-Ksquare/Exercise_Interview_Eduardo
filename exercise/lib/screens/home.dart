import 'package:exercise/screens/details.dart';
import 'package:exercise/services/series_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HOME"),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: FutureBuilder(
          future: SerieService().getShows(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List<dynamic> series = snapshot.data;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListView.builder(
                      itemCount: series.length,
                      itemBuilder: (BuildContext context, int index) {
                        String title = series[index]["name"];
                        String image = series[index]["image"]["medium"];
                        String language = series[index]["language"];
                        String genres = series[index]["genres"].join("");
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => DetailScreen(
                                          title: title,
                                          image: image,
                                          genres: genres,
                                          language: language))));
                            },
                            child: ListTile(
                              title: Text(title),
                              leading: Image.network(
                                image,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.network(
                                      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/1899-1666707992.jpg?crop=1.00xw:1.00xh;0,0&resize=980:*");
                                },
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

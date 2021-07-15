import 'package:flutter/material.dart';
import 'package:movies/data/get_data.dart';
import 'package:movies/data/movie.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  List<Movie> movieList = [];
  @override
  void initState() {
    super.initState();
    getData().then((value) => setState(() {
          movieList = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Movies"),
          elevation: 0,
        ),
        body: movieList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: Image.network(
                      movieList[i].poster,
                      fit: BoxFit.fill,
                    ),
                    title: Text(movieList[i].title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Genre: ${movieList[i].genre}"),
                        Text("Director: ${movieList[i].director.join(",")}"),
                        Text("Starring: ${movieList[i].stars.join(",")}"),
                        Text("Languages: ${movieList[i].language}"),
                        Text(
                          "${movieList[i].pageViews} views",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  );
                }));
  }
}

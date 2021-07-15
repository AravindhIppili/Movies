import 'package:flutter/material.dart';
import 'package:movies/const.dart';
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
            : ListView.separated(
                separatorBuilder: (context, i) => Divider(
                      height: 40,
                    ),
                padding: kDefPadding,
                itemCount: movieList.length,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Image.network(
                          movieList[i].poster,
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movieList[i].title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Genre: ${movieList[i].genre}"),
                              Text(
                                  "Director: ${movieList[i].director.join(",")}"),
                              Text("Starring: ${movieList[i].stars.join(",")}"),
                              Text("Languages: ${movieList[i].language}"),
                              Text(
                                "${movieList[i].pageViews} views",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }));
  }
}

import 'package:flutter/material.dart';
import 'package:movie_stream_app/db/temp_db.dart';

class MovieDetails extends StatelessWidget {
  final int id;
  MovieDetails(this.id);
  @override
  Widget build(BuildContext context) {
    final movie = movies.firstWhere((movie) => movie.id == id);
    return Scaffold(
      /* appBar: AppBar(
        title: Text(
          'Movie Details'
        ),
      ), */
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: movie.id,
                  child: Image.asset(
                  movie.image,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  movie.name,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 5),
                child: Text(
                  movie.category,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(description,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Nunito',
                    )),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

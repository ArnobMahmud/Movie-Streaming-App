import 'package:flutter/material.dart';
import 'package:movie_stream_app/db/temp_db.dart';
import 'package:movie_stream_app/widgets/movie_items.dart';

import 'new_movie_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _value == false ? Colors.white : Colors.black,
      appBar: AppBar(
        title: Text(
          'Movie Stream',
          style: TextStyle(
            fontFamily: 'Kufam',
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MovieItem(movie: movies[index]),
        itemCount: movies.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => NewMoviePage(),
             )
          );
        },
      ),
    );
  }
}

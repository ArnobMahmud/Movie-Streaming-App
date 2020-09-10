import 'package:flutter/material.dart';
import 'package:movie_stream_app/models/movie_model.dart';

class NewMoviePage extends StatefulWidget {
  @override
  _NewMoviePageState createState() => _NewMoviePageState();
}

class _NewMoviePageState extends State<NewMoviePage> {
  var movie = Movie();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Movie'),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Movie Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'This Field Must Not be Empty';
                }
                return null;
              },
              onSaved: (value) {
                movie.name = value;
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Rating',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'This Field Must Not be Empty';
                }
                return null;
              },
              onSaved: (value) {
                movie.name = value;
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter Description',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'This Field Must Not be Empty';
                }
                return null;
              },
              onSaved: (value) {
                movie.name = value;
              },
            )
          ],
        ),
      )),
    );
  }
}

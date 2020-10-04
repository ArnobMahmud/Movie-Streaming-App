import 'package:flutter/material.dart';
import 'package:movie_stream_app/models/movie_model.dart';

class NewMoviePage extends StatefulWidget {
  @override
  _NewMoviePageState createState() => _NewMoviePageState();
}

class _NewMoviePageState extends State<NewMoviePage> {
  var movie = Movie();
  final _formKey = GlobalKey<FormState>();
  void _saveMovie() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Movie"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter Movie Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This field mustn't be empty";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    movie.name = value;
                  }),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Enter Rating",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This field mustn't be empty";
                    }
                    if (double.parse(value) < 0 || double.parse(value) > 10) {
                      return "TRating must be between 0 to 10";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    movie.rating = double.parse(value);
                  }),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  maxLines: 6,
                  decoration: InputDecoration(
                    labelText: "Enter Description",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This field mustn't be empty";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    movie.description = value;
                  }),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)),
                color: Colors.red[200],
                child: Text("Save"),
                onPressed: _saveMovie,
              )
            ],
          ),
        ),
      ),
    );
  }
}

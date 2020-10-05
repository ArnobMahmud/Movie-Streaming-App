import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:movie_stream_app/Pages/home_page.dart';
import 'package:movie_stream_app/db/db_sqlflite.dart';
import 'package:movie_stream_app/models/movie_model.dart';

class NewMoviePage extends StatefulWidget {
  @override
  _NewMoviePageState createState() => _NewMoviePageState();
}

class _NewMoviePageState extends State<NewMoviePage> {
  DateTime _selectedDate;
  String date;
  String category = 'Action';
  String _imagePath;

  var movie = Movie();
  final _formKey = GlobalKey<FormState>();
  void _saveMovie() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      movie.category = category;
      DBSQliteHelper.insertMovie(movie).then((id) {
        if (id > 0) {
          // go to movie page
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
              builder: (context) => HomePage(),
             )
          );
        }
      });
    }
  }

  void _openDatePickerDialog() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime(2030),
    ).then((date) {
      setState(() {
        _selectedDate = date;
        movie.releaseDate = _selectedDate.microsecondsSinceEpoch;
      });
    });
  }

  void captureImage() async {
    var capturedImageFile =
        await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _imagePath = capturedImageFile.path;
      movie.image = _imagePath;
    });
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
              Row(
                children: [
                  FlatButton(
                    child: Text("Select Release Date"),
                    onPressed: _openDatePickerDialog,
                  ),
                  Text(_selectedDate == null
                      ? "No Date Chosen"
                      : DateFormat('EEE, MMM dd, yyyy').format(_selectedDate)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              // DropdownButton(
              //   value: category,  // by default
              //   items: categories
              //       .map((cat) => DropdownMenuItem(
              //             value: cat,   // one by one
              //             child: Text(cat),
              //           ))
              //       .toList(),
              //   onChanged: (value) {
              //     setState(() {
              //       category = value;  // by default = user picked
              //     });
              //   },
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 160,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _imagePath == null
                        ? Text(
                            "No image found",
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          )
                        : Image.file(
                            File(_imagePath),
                            fit: BoxFit.cover,
                          ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.camera,
                      size: 30,
                      color: Colors.green,
                    ),
                    onPressed: captureImage,
                  )
                ],
              ),
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

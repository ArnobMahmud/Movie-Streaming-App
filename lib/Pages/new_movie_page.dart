import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_stream_app/db/temp_db.dart';
import 'package:movie_stream_app/models/movie_model.dart';

class NewMoviePage extends StatefulWidget {
  @override
  _NewMoviePageState createState() => _NewMoviePageState();
}

class _NewMoviePageState extends State<NewMoviePage> {
  var movie = Movie();
  DateTime _selectedDate;
  String category = 'Action';

  final _formKey = GlobalKey<FormState>();
  void _saveMovie() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      movie.category = category;
    }
  }

  void _openDatePickerDialouge() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1940),
        lastDate: DateTime(2030));

    setState(() {
      _selectedDate = date; //dd/mm/yyyy
      movie.releaseYear = _selectedDate.year;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Movie'),
      ),
      body: Form(
          key: _formKey,
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
                SizedBox(
                  height: 10,
                ),
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
                    if (double.parse(value) < 0 || double.parse(value) > 10) {
                      return 'Rating Should be Between 1 to 10.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    movie.rating = double.parse(value);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 5,
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
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    FlatButton(
                        child: Text('Select Release Date'),
                        onPressed: () {
                          _openDatePickerDialouge();
                          Text(_selectedDate == null
                              ? 'Pick a date'
                              : DateFormat('EEE, MMM dd , yyyy')
                                  .format(_selectedDate));
                        }),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButton(
                    value: category,
                    items: categories.map((cat) =>
                        DropdownMenuItem(value: cat, child: Text(cat))),
                    onChanged: (value) {
                      setState(() {
                        category = value;
                      });
                    }),
                RaisedButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    child: Text('Save'),
                    onPressed: () {
                      _saveMovie();
                    })
              ],
            ),
          )),
    );
  }
}

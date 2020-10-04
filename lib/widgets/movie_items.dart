import 'package:flutter/material.dart';
import 'package:movie_stream_app/Pages/movie_details.dart';
import 'package:movie_stream_app/models/movie_model.dart';

class MovieItem extends StatefulWidget {
  final Movie movie;
  const MovieItem({Key key, this.movie}) : super(key: key);

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetails(widget.movie.id)));
      },
      child: Card(
          color: Color(0xFF445361),
          margin: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Hero(
                tag: widget.movie.id,
                child: Image.asset(
                  widget.movie.image,
                  //width: double.maxFinite,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.green[200],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${widget.movie.releaseYear}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Martel',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.category,
                          color: Colors.purple[200],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(widget.movie.category,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Martel',
                              fontSize: 16,
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('${widget.movie.rating}',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Martel',
                              fontSize: 16,
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      icon: Icon(
                        widget.movie.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.movie.isFavourite =! widget.movie.isFavourite;
                        });
                      },
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

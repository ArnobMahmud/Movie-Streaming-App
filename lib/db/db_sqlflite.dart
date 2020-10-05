import 'package:movie_stream_app/models/movie_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;

class DBSQliteHelper {
  static final String CREATE_TABLE_MOVIE = '''create table $TABLE_MOVIE(
    $MOVIE_COL_ID integer primary key autoincrement,
    $MOVIE_COL_IMAGE text not null,
    $MOVIE_COL_CATEGORY text not null,
    $MOVIE_COL_DATE integer not null,
    $MOVIE_COL_RATING real not null,
    $MOVIE_COL_IMAGE text not null,
    $MOVIE_COL_DESCRIPTION text not null,
    $MOVIE_COL_FAV integer not null,
  )''';

  static Future<Database> open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = Path.join(rootPath, 'movie.db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      await db.execute(CREATE_TABLE_MOVIE);
    });
  }

  static Future<int> insertMovie(Movie movie) async {
    var db = await open();
    return db.insert(TABLE_MOVIE, movie.toMap());
  }

  static Future<List<Movie>> getAllMovies() async {
    var db = await open();
    // db.query(TABLE_MOVIE, orderBy: '', );
    List<Map<String, dynamic>> mapList =
        await db.rawQuery('select * from $TABLE_MOVIE');
    return List.generate(
        mapList.length, (index) => Movie.fromMap(mapList[index]));
  }
}

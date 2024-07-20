import 'package:flutter/cupertino.dart';
import '../ResponseModel/MoviesListResponse.dart';

class MenuProvider extends ChangeNotifier {
  Results? movieValues;
  Results? get getMovieValues => movieValues;
  void setMoviesValues(Results data) {
    movieValues = data;
    notifyListeners();
  }
}

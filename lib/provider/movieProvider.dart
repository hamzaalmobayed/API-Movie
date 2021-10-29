import 'package:flutter/cupertino.dart';
import 'package:movie_app_api/model/genere.dart';
import 'package:movie_app_api/model/movie.dart';
import 'package:movie_app_api/model/movieDetail.dart';
import 'package:movie_app_api/model/person.dart';
import 'package:movie_app_api/service/apiService.dart';

class MovieProvider extends ChangeNotifier{
MovieProvider(){
  getNowPlayingMovies();
}
List<Movie> movieList;
List<Genre> genre;
List<Movie> genreId;
List<Person> trendingPerson;
int selectedGenre;
MovieDetail movieDetails;
int selectedMovie;
BuildContext context1;
getNowPlayingMovies()async{
  List<Movie> movieList= await ApiService.apiService.getNowPlayingMovie();
  this.movieList=movieList;
  notifyListeners();
}
getGenre()async{
  List<Genre> genre=await ApiService.apiService.getGenreList();
  this.genre=genre;
  notifyListeners();
}
getGenreById()async{
  List<Movie> genreId=await ApiService.apiService.getMovieByGenre(selectedGenre);
  this.genreId=genreId;
  notifyListeners();
}
getTrendingPerson() async {
  List<Person> trendingPerson=await ApiService.apiService.getTrendingPerson();
  this.trendingPerson=trendingPerson;
  notifyListeners();
}
getMovieDetail() async {
  MovieDetail movieDetails=await ApiService.apiService.getMovieDetail(selectedMovie);
  this.movieDetails=movieDetails;
  notifyListeners();
}
selectGenreId(int id){
  this.selectedGenre=id;
  notifyListeners();
}
selectMovieId(int id){
  this.selectedMovie=id;
  notifyListeners();
}


}
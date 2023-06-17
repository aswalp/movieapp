import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/newmoviesl_model.dart';

final popMoviesprovider = Provider<List<Newmovies>>((ref) => [
      Newmovies(
          images: "assets/images/popularMovies/pmovie1.jpeg",
          name: "joker",
          description: "drama/Thriler/action",
          rating: 3.9),
      Newmovies(
          images: "assets/images/popularMovies/pmovie2.jpeg",
          name: "Romancham",
          description: "drama/comedy/horror",
          rating: 3.7),
      Newmovies(
          images: "assets/images/popularMovies/pmovie3.jpeg",
          name: "Avatar",
          description: "action/thriller/sci-fi",
          rating: 4.5),
      Newmovies(
          images: "assets/images/popularMovies/pmovie4.jpg",
          name: "John wick 4",
          description: "Drama/thriller/action",
          rating: 4.5),
      Newmovies(
          images: "assets/images/popularMovies/pmovie5.jpg",
          name: "Puss in Boots 2",
          description: "comedy/animation/thriller/action",
          rating: 4.3),
    ]);

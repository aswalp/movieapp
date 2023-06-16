import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/newmoviesl_model.dart';

final newmoviesprovider = Provider<List<Newmovies>>((ref) => [
      Newmovies(
          images: "assets/images/newmovies/movie1.jpeg",
          name: "Jawan",
          description: "drama/sci-fi/action",
          rating: 4.0),
      Newmovies(
          images: "assets/images/newmovies/movie2.jpg",
          name: "Adipurush",
          description: "drama/action/Myth",
          rating: 3.7),
      Newmovies(
          images: "assets/images/newmovies/movie3.jpg",
          name: "across the spider-verse",
          description: "comedy/action/Animation/sci-fi",
          rating: 4.5),
      Newmovies(
          images: "assets/images/newmovies/movie4.jpg",
          name: "2018",
          description: "Drama/thriller/action",
          rating: 4.5),
    ]);

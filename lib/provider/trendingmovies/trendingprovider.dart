import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/main_movie_model.dart';
import 'package:movieapp/models/newmoviesl_model.dart';
import 'package:movieapp/services/apiserives.dart';

final trendingprovider = Provider<List<Newmovies>>((ref) => [
      Newmovies(
          images: "assets/images/trendingmovies/tmovie1.jpg",
          name: "Transformers",
          description: "drama/sci-fi/action",
          rating: 3.9),
      Newmovies(
          images: "assets/images/trendingmovies/tmovie2.jpg",
          name: "Neymar",
          description: "drama/action/Myth",
          rating: 3.7),
      Newmovies(
          images: "assets/images/trendingmovies/tmovie3.jpg",
          name: "across the spider-verse",
          description: "comedy/action/Animation/sci-fi",
          rating: 4.5),
      Newmovies(
          images: "assets/images/trendingmovies/tmovie4.jpg",
          name: "2018",
          description: "Drama/thriller/action",
          rating: 4.5),
      Newmovies(
          images: "assets/images/trendingmovies/tmovie5.jpg",
          name: "Flash",
          description: "Drama/thriller/action",
          rating: 4.3),
    ]);

final maintrendindday = FutureProvider<MainMovieModels>((ref) async {
  return ref.watch(apiservicesProvider).getTrendingday();
});

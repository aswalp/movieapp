import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/main_movie_model.dart';
import 'package:movieapp/models/newmoviesl_model.dart';
import 'package:movieapp/services/apiserives.dart';

final animationprovider = Provider<List<Newmovies>>((ref) => [
      Newmovies(
          images: "assets/images/animation/amovie1.jpg",
          name: "Jujutsu Kaisen 0",
          description: "dark/animation/action",
          rating: 3.9),
      Newmovies(
          images: "assets/images/animation/amovie2.jpeg",
          name: "one piece",
          description: "animation/action/comedy",
          rating: 3.7),
      Newmovies(
          images: "assets/images/animation/amovie3.jpg",
          name: "Demon Slayer",
          description: "comedy/action/Animation",
          rating: 4.5),
      Newmovies(
          images: "assets/images/animation/amovie4.jpg",
          name: "Suzame",
          description: "Drama/thriller/animation",
          rating: 4.5),
      Newmovies(
          images: "assets/images/animation/amovie5.jpg",
          name: "Puss in boots",
          description: "Drama/comedy/action/animation",
          rating: 4.3),
    ]);

final maintopratedprovider = FutureProvider<MainMovieModels>((ref) async {
  return ref.watch(apiservicesProvider).gettoprated();
});

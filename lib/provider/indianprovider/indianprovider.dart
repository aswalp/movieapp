import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/main_movie_model.dart';
import 'package:movieapp/services/apiserives.dart';

final malayalamprovider = FutureProvider<MainMovieModels>((ref) async {
  return ref.watch(apiservicesProvider).getmalayalammovies();
});

final hindiprovider = FutureProvider<MainMovieModels>((ref) async {
  return ref.watch(apiservicesProvider).gethindimovies();
});
final tamilprovider = FutureProvider<MainMovieModels>((ref) async {
  return ref.watch(apiservicesProvider).gettamilmovies();
});
final teluguprovider = FutureProvider<MainMovieModels>((ref) async {
  return ref.watch(apiservicesProvider).gettelugumovies();
});

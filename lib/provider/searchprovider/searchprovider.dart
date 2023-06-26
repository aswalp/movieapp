import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/main_movie_model.dart';
import 'package:movieapp/services/apiserives.dart';

final searchValueProvider = Provider((ref) => SearchValue(''));

final searchMoviesProvider = FutureProvider<MainMovieModels>((ref) async {
  final apiservices = ref.watch(apiservicesProvider);
  final String movie = ref.watch(searchValueProvider).value;

  try {
    return await apiservices.getsearchmovies(movie);
  } catch (e) {
    throw Exception(e);
  }
});

class SearchValue {
  String value;

  SearchValue(this.value);
}

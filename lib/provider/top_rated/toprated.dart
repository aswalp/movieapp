import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/main_movie_model.dart';
import 'package:movieapp/services/apiserives.dart';

final maintopratedprovider = FutureProvider<MainMovieModels>((ref) async {
  return ref.watch(apiservicesProvider).gettoprated();
});

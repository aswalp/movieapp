import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/main_movie_model.dart';
import 'package:movieapp/services/apiserives.dart';
//
//
//
//trending day
//

final maintrendindday = FutureProvider<MainMovieModels>((ref) async {
  return ref.watch(apiservicesProvider).getTrendingday();
});

//
//
//
//trending week
//

final maintrendingweek = FutureProvider<MainMovieModels>((ref) async {
  return ref.watch(apiservicesProvider).getTrendingweek();
});

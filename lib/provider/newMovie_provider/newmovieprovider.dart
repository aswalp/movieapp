import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/main_movie_model.dart';

import '../../services/apiserives.dart';

final mainnowplayprovider = FutureProvider<MainMovieModels>((ref) async {
  return ref.watch(apiservicesProvider).getnowplay();
});

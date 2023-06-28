import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/CastModel.dart';
import 'package:movieapp/services/apiserives.dart';

// final movieidprovider = StateProvider<int>((ref) {
//   return 0;
// });

final castprovider =
    FutureProvider.family<CastAndCrewModel, int>((ref, id) async {
  return ref.watch(apiservicesProvider).getcast(id);
});

import 'package:movieapp/models/genere_model.dart';

List<String> generefunction(List<int> genereid, List<GenreModel> genname) {
  List<String> main = [];

  for (int i in genereid) {
    for (GenreModel g in genname) {
      if (i == g.id) {
        main.add(g.name!);
      }
    }
  }

  return main;
}

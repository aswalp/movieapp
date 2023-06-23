// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movieapp/responsive/responisive.dart';
// import 'package:movieapp/view/home_page/widget/profile_drawer.dart';

import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  List<String> list = ["apple", "banana", "mango", "jackfruit", "grapes"];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchqury = [];

    for (String i in list) {
      if (i.toLowerCase().contains(query.toLowerCase())) {
        matchqury.add(query);
      }
    }
    return ListView.builder(
      itemCount: matchqury.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchqury[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchqury = [];

    for (String i in list) {
      if (i.toLowerCase().contains(query.toLowerCase())) {
        matchqury.add(i);
      }
    }
    return ListView.builder(
      itemCount: matchqury.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(matchqury[index]),
        );
      },
    );
  }
}




// class SearchUi extends ConsumerWidget {
//   const SearchUi({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     bool mode = ref.watch(modeProvider);

//     double sh = MediaQuery.of(context).size.height;
//     double sw = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: mode ? const Color(0xff0a141c) : Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: !mode ? const Color(0xff0a141c) : Colors.white,
//             )),
//         backgroundColor: mode ? const Color(0xff0a141c) : Colors.white,
//         centerTitle: true,
//         title: Text(
//           "Search",
//           style: TextStyle(
//               color: mode ? Responsive.primerycolors : Colors.black,
//               fontFamily: "Righteous",
//               fontSize: sw * (24 / Responsive.width)),
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: sw * (15 / Responsive.width),
//                 vertical: sh * (10 / Responsive.height)),
//             child: SizedBox(
//               height: sh * (60 / Responsive.height),
//               width: sw,
//               child: TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 style: TextStyle(
//                     color: mode ? Colors.white : Colors.black,
//                     fontSize: sw * (12 / Responsive.width)),
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: mode ? const Color(0xff272111) : Color(0xFF878484),
//                   prefixIcon: const Icon(Icons.search),
//                   prefixIconColor: mode ? Colors.white : Colors.black,
//                   labelText: "Search Movies",
//                   labelStyle: TextStyle(
//                       color: mode ? Colors.white : Colors.black,
//                       fontFamily: "Karla",
//                       fontSize: sw * (12 / Responsive.width)),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide:
//                         const BorderSide(color: Colors.transparent, width: 2),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide:
//                         const BorderSide(color: Colors.transparent, width: 2),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide:
//                         const BorderSide(color: Colors.transparent, width: 2),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


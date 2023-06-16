import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/provider/newMovie_provider/newmovieprovider.dart';
import 'package:movieapp/provider/trendingmovies/trendingprovider.dart';
import 'package:movieapp/responsive/responisive.dart';
import 'package:movieapp/view/home_page/widget/newmoviesroller.dart';

class HomePageUi extends ConsumerWidget {
  const HomePageUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Color(0xff0a141c),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: sh * (30 / Responsive.height),
                    width: sw * (30 / Responsive.width),
                    child: Image.asset(
                      "assets/images/icons/flashicon.png",
                      fit: BoxFit.contain,
                    )),
                Text(
                  "Flash Movies",
                  style: TextStyle(
                      color: Responsive.primerycolors,
                      fontFamily: "Righteous",
                      fontSize: sw * (28 / Responsive.width)),
                ),
              ],
            ),
            expandedHeight: sh * (440 / Responsive.height),
            flexibleSpace: FlexibleSpaceBar(
              background: buildnewmovieslider(sh),
            ),
            // primary: false,
            floating: true,
            pinned: true,
            backgroundColor: Colors.transparent,
            // expandedHeight: 550,
            leading: Padding(
              padding: const EdgeInsets.all((8.0)),
              child: CircleAvatar(
                // radius: 10,
                backgroundColor: Color(0x54FFFFFF),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            actions: [
              CircleAvatar(
                backgroundColor: Color(0x54FFFFFF),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sw * (15.0 / Responsive.width)),
              child: Column(
                children: [
                  // buildnewmovieslider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Righteous",
                            fontSize: sw * (20 / Responsive.width)),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Righteous",
                            fontSize: sw * (12 / Responsive.width)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sh * (10 / Responsive.height),
                  ),

                  SizedBox(
                    height: sh * (110 / Responsive.height),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          height: sh * (100 / Responsive.height),
                          width: sw * (150 / Responsive.width),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                    ref.watch(trendingprovider)[index].images),
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: sw * (10 / Responsive.width),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Consumer buildnewmovieslider(double sh) {
    return Consumer(builder: (context, ref, _) {
      return CarouselSlider.builder(
        itemCount: ref.watch(newmoviesprovider).length,
        itemBuilder: (context, index, realIndex) {
          return NewMoviesScroller(
            index: index,
          );
        },
        options: CarouselOptions(
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            height: sh * (350 / Responsive.height),
            autoPlay: true,
            reverse: true,
            enlargeCenterPage: true),
      );
    });
  }
}

//  SafeArea(
//         child: Column(
//           children: [
//             CarouselSlider.builder(
//               itemCount: 4,
//               itemBuilder: (context, index, realIndex) {
//                 return NewMoviesScroller(
//                   index: index,
//                 );
//               },
//               options: CarouselOptions(
//                   enlargeStrategy: CenterPageEnlargeStrategy.height,
//                   height: 350,
//                   autoPlay: true,
//                   reverse: true,
//                   enlargeCenterPage: true),
//             ),
//           ],
//         ),
//       ),

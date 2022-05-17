

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie/page/description.dart';

import '../utils/text.dart';
class slider extends StatelessWidget {
  const slider({Key? key, required this.trending}) : super(key: key);
  final List? trending;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
      child: CarouselSlider.builder(
          itemCount: trending!.length,
          itemBuilder: ( context ,Index, realIndex){
            final trendings = trending![Index];
            return buildslider(trendings, Index,context);
          }, options:CarouselOptions(
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration:
        Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: true,
        viewportFraction: 0.8,
        enlargeCenterPage: true,

    ),

      ));
  }

  Widget buildslider( trendings, int index, context) =>
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Description(
                    name:  trending![index]['title'] ?? 'Loading',
                    bannerurl:
                    'https://image.tmdb.org/t/p/w500' +
                        trending![index]['backdrop_path'],
                    posterurl:
                    'https://image.tmdb.org/t/p/w500' +
                        trending![index]['poster_path'],
                    description: trending![index][ 'overview'] ?? 'Loading',
                    vote: trending![index]['vote_average']
                        .toString() ,
                    launch_on: trending![index]
                    ['release_date'] ?? 'Loading',
                  )));
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children:<Widget>[
            ClipRRect(

              child: Container(
                 width: 303,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
              ),
                    image: DecorationImage(
                      image: NetworkImage(
                          ('https://image.tmdb.org/t/p/w500' +
                              trending![index]['poster_path'])



                      ),



                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 200,


                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: 15,
                        left: 15,
                      ),
                      child: Text(
                         trending![index]['title'] != null
                            ? trending![index]['title']
                            : 'Loading',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'muli',
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),

              ),
            ),
          ]

        ),
      );


}


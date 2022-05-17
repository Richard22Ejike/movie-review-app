

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:movie/page/slider.dart';
import 'package:movie/page/toprated.dart';
import 'package:movie/page/trending.dart';
import 'package:movie/page/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '18e5cc11a7d0303561a84098c7e4866a';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxOGU1Y2MxMWE3ZDAzMDM1NjFhODQwOThjN2U0ODY2YSIsInN1YiI6IjYyN2U0MGMxYzkyYzVkMDA1MmRjZTkzMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Kw-Vf5s5gbcgsiRZcJAX6RcmCFsuH71ni5opMZ7maA0';

  @override
  void initState(){
    loadmovies();
    super.initState();
  }


  loadmovies () async{
    TMDB tmdbwithCustomlogs = TMDB(ApiKeys(apikey,readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
     Map trendingresult = await tmdbwithCustomlogs.v3.trending.getTrending();
    Map topratedresult = await tmdbwithCustomlogs.v3.movies.getTopRated();
    Map tvresult = await tmdbwithCustomlogs.v3.tv.getPopular();
     setState(() {
       trendingmovies = trendingresult['results'];
       topratedmovies = topratedresult['results'];
       tv = tvresult['results'];
     });
     print(topratedmovies);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie trailer app'),
      ),
        body: ListView(
          children: [

            slider(
              trending: trendingmovies,
            ),

                TV(tv: tv),

                TopRatedMovies(
                  toprated: topratedmovies,
                ),

          ],
        )
    );
  }
}

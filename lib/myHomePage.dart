import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_api/appBar.dart';
import 'package:movie_app_api/carousel.dart';
import 'package:movie_app_api/category.dart';
import 'package:movie_app_api/model/movieDetail.dart';
import 'package:movie_app_api/person.dart';
import 'package:movie_app_api/provider/movieProvider.dart';
import 'package:provider/provider.dart';

import 'categoryMovie.dart';
import 'movieDetails.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder:(context,p,x)=> Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight+20),
            child: CustomAppBar()
        ),
        body: Container(
          color: Colors.black,
          child: ListView(
            children: <Widget>[
              Carousel(),
              BuildWidgetCategory(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  child: Text(
                    'new playing'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'muli',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Posters(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Trending persons of this week'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'muli',
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Person(),
            ],
          ),
        ),
      ),
    );
  }
}
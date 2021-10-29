import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_api/provider/movieProvider.dart';
import 'package:provider/provider.dart';

import 'movieDetails.dart';
class Carousel extends StatefulWidget {

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context,p,x)=>Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: CarouselSlider(
          items:p.movieList.map((e) => InkWell(
            onTap: () {
              p.selectMovieId(e.id);
              p.getMovieDetail();
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white.withOpacity(0),
                      insetPadding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.zero,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      content:Builder(
                        builder: (context) {
                          // Get available height and width of the build area of this widget. Make a choice depending on the size.
                          var height = MediaQuery.of(context).size.height;
                          var width = MediaQuery.of(context).size.width;

                          return Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.zero,
                              color:Colors.white.withOpacity(0) ,
                              height:height,
                              width: width,
                              child: CircularProgressIndicator(
                                strokeWidth: 5,
                                color: Colors.white,
                              ));
                        },
                      ),

                    );
                  });
              Future.delayed(Duration(seconds: 5)).then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>MovieDetails()
                ),
              ));
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(BorderSide(color: Colors.white)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),),
                  child: ClipRRect(
                    child: CachedNetworkImage(
                        imageUrl:
                        'https://image.tmdb.org/t/p/original/${e.backdropPath}',
                        height:
                        MediaQuery.of(context).size.height /
                            3,
                        width:
                        MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator(color: Colors.white,))
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 15,
                    left: 15,
                  ),
                  child: Text(
                    e.title.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'muli',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )).toList(),
          options: CarouselOptions(
            height: 250,
            aspectRatio: 16/9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}

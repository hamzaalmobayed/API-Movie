import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app_api/provider/movieProvider.dart';
import 'package:provider/provider.dart';

import 'movieDetails.dart';
class Posters extends StatefulWidget {

  @override
  _PostersState createState() => _PostersState();
}

class _PostersState extends State<Posters> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder:(context,p,x)=>p.genreId.length==0?Container(
        height: 310,
        child: Center(
          child: CircularProgressIndicator(color: Colors.white,),
        ),
      ):SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children:p.genreId.map((e) => Padding(
              padding: const EdgeInsets.all( 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
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
                    child: ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl:
                        'https://image.tmdb.org/t/p/original/${e.backdropPath}',
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            width: 230,
                            height: 250,
                            decoration: BoxDecoration(
                                border: Border.fromBorderSide(BorderSide(color: Colors.white)),
                                borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        placeholder: (context, url) => Container(
                          width: 230,
                          height: 250,
                          child: Center(
                            child:CircularProgressIndicator()
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: 180,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/img_not_found.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 180,
                    child: Text(
                      e.title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'muli',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: 230,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    RatingBar.builder(
                    initialRating: double.parse(e.voteAverage),
                      minRating: 1,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 10,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                        Text(
                          e.voteAverage,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )).toList() ,
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_api/provider/movieProvider.dart';
import 'package:provider/provider.dart';
class Person extends StatefulWidget {

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context,p,x)=>SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,bottom: 20),
          child: Row(
            children: p.trendingPerson.map((e) => Container(
              child: Column(
                children: <Widget>[
                  Card(
                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius
                          .circular(
                          100),
                    ),
                    elevation: 3,
                    child: ClipRRect(
                      child:
                      CachedNetworkImage(
                        imageUrl:
                        'https://image.tmdb.org/t/p/w200${e.profilePath}',
                        imageBuilder: (context,
                            imageProvider) {
                          return Container(
                            width: 80,
                            height: 80,
                            decoration:
                            BoxDecoration(
                              border: Border.fromBorderSide(BorderSide(color: Colors.white)),
                              borderRadius:
                              BorderRadius
                                  .all(
                                Radius
                                    .circular(
                                    100),
                              ),
                              image:
                              DecorationImage(
                                image:
                                imageProvider,
                                fit: BoxFit
                                    .cover,
                              ),
                            ),
                          );
                        },
                        placeholder:
                            (context,
                            url) =>
                            Container(
                              width: 80,
                              height: 80,
                              child: Center(
                                child:CircularProgressIndicator()
                              ),
                            ),
                        errorWidget:
                            (context, url,
                            error) =>
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      border: Border.fromBorderSide(BorderSide(color: Colors.white)),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      )),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/img_not_found.jpg'),
                                    radius: 30,
                                  ),
                                ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        e.name
                            .toUpperCase(),
                        style: TextStyle(
                          color: Colors
                              .white,
                          fontSize: 8,
                          fontFamily:
                          'muli',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        e
                            .knowForDepartment
                            .toUpperCase(),
                        style: TextStyle(
                          color: Colors
                              .white,
                          fontSize: 8,
                          fontFamily:
                          'muli',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),
          ),
        ),
      ),
    );
  }
}

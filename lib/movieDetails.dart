import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_api/myHomePage.dart';
import 'package:movie_app_api/provider/movieProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/castList.dart';
import 'model/screenShot.dart';
class MovieDetails extends StatefulWidget {

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder:(context,p,x)=> WillPopScope(
        onWillPop: (){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>MyHomePage()
            ),
          );
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              Stack(
              children: <Widget>[
                ClipPath(
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl:
                      'https://image.tmdb.org/t/p/original/${p.movieDetails.backdropPath}',
                      height: MediaQuery.of(context).size.height / 2,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Container(
                        width: 80,
                        height: 80,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/img_not_found.jpg'),
                          radius: 30,
                        ),
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 120),
                      child: GestureDetector(
                        onTap: () async {
                          final youtubeUrl =
                              'https://www.youtube.com/embed/${p.movieDetails.trailerId}';
                          if (await canLaunch(youtubeUrl)) {
                            await launch(youtubeUrl);
                          }
                        },
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.play_circle_outline,
                                color: Colors.yellow,
                                size: 65,
                              ),
                              Text(
                                p.movieDetails.title.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'muli',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Overview'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 35,
                            child: Text(
                              p.movieDetails.overview,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontFamily: 'muli'),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Release date'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'muli',
                                    ),
                                  ),
                                  Text(
                                    p.movieDetails.releaseDate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .copyWith(
                                      color: Colors.yellow[800],
                                      fontSize: 12,
                                      fontFamily: 'muli',
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'run time'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'muli',
                                    ),
                                  ),
                                  Text(
                                    p.movieDetails.runtime,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .copyWith(
                                      color: Colors.yellow[800],
                                      fontSize: 12,
                                      fontFamily: 'muli',
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'budget'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'muli',
                                    ),
                                  ),
                                  Text(
                                    p.movieDetails.budget,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .copyWith(
                                      color: Colors.yellow[800],
                                      fontSize: 12,
                                      fontFamily: 'muli',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Screenshots'.toUpperCase(),
                            style: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'muli',
                            ),
                          ),
                          Container(
                            height: 155,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  VerticalDivider(
                                    color: Colors.transparent,
                                    width: 5,
                                  ),
                              scrollDirection: Axis.horizontal,
                              itemCount:p.movieDetails.movieImage.backdrops.length,
                              itemBuilder: (context, index) {
                                Screenshot image =
                                p.movieDetails.movieImage.backdrops[index];
                                return Container(
                                  child: Card(
                                    elevation: 3,
                                    borderOnForeground: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.fromBorderSide(BorderSide(color: Colors.white)),
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()
                                          ),
                                          imageUrl:
                                          'https://image.tmdb.org/t/p/w500${image.imagePath}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Casts'.toUpperCase(),
                            style: Theme.of(context).textTheme.caption.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'muli',
                            ),
                          ),
                          Container(
                            height: 110,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  VerticalDivider(
                                    color: Colors.transparent,
                                    width: 5,
                                  ),
                              itemCount: p.movieDetails.castList.length,
                              itemBuilder: (context, index) {
                                Cast cast =p.movieDetails.castList[index];
                                return Container(
                                  child: Column(
                                    children: <Widget>[
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(100),
                                        ),
                                        elevation: 3,
                                        child: ClipRRect(
                                          child: CachedNetworkImage(
                                            imageUrl:
                                            'https://image.tmdb.org/t/p/w200${cast.profilePath}',
                                            imageBuilder:
                                                (context, imageBuilder) {
                                              return Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  border: Border.fromBorderSide(BorderSide(color: Colors.white)),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(100)),
                                                  image: DecorationImage(
                                                    image: imageBuilder,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            },
                                            placeholder: (context, url) =>
                                                Container(
                                                  width: 80,
                                                  height: 80,
                                                  child: Center(
                                                    child:CircularProgressIndicator()
                                                  ),
                                                ),
                                            errorWidget: (context, url, error) =>
                                                Container(
                                                  width: 80,
                                                  height: 80,
                                decoration: BoxDecoration(
                                border: Border.fromBorderSide(BorderSide(color: Colors.white)),
                                borderRadius: BorderRadius.all(
                                Radius.circular(50),
                                ),),
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
                                            cast.name.toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8,
                                              fontFamily: 'muli',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(
                                            cast.character.toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8,
                                              fontFamily: 'muli',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20,)

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),]
          ),
        ),
      ),
    );
  }
}

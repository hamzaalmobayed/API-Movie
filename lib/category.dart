import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_api/provider/movieProvider.dart';
import 'package:provider/provider.dart';

import 'model/movie.dart';

class BuildWidgetCategory extends StatefulWidget {
  final int selectedGenre;

  const BuildWidgetCategory({Key key, this.selectedGenre = 28})
      : super(key: key);

  @override
  BuildWidgetCategoryState createState() => BuildWidgetCategoryState();
}

class BuildWidgetCategoryState extends State<BuildWidgetCategory> {
  int selectedGenre;

  @override
  void initState() {
    super.initState();
  }
  Color white=Colors.white;
  Color black=Colors.black;
  @override
  Widget build(BuildContext conte) {
    return Consumer<MovieProvider>(
      builder: (context,p,x)=>SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: p.genre.map((e) => ClipRRect(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: InkWell(
                    borderRadius:BorderRadius.all(Radius.circular(30)) ,
                    onTap: (){
                      p.genreId.clear();
                      p.selectGenreId(e.id);
                      p.getGenreById();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(BorderSide(color: Colors.white)),
                        color:p.selectedGenre==e.id?Colors.black54: white,
                        borderRadius:BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(e.name,style: TextStyle(color: p.selectedGenre==e.id?Colors.white: black,fontSize: 15),),
                      ),
                    ),
                  ),
                ),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              )).toList(),
            ),
          )),
    );

  }

}
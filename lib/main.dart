
import 'package:flutter/material.dart';
import 'package:movie_app_api/myHomePage.dart';
import 'package:movie_app_api/provider/movieProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(child: MyApp(),create: (context)=>MovieProvider(),));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          )
      ),
      title: 'Movie App',
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 200)).then((value) =>Provider.of<MovieProvider>(context,listen: false).getNowPlayingMovies()
        );
    Future.delayed(Duration(milliseconds: 200)).then((value) =>Provider.of<MovieProvider>(context,listen: false).selectGenreId(28)
    );
    Future.delayed(Duration(milliseconds: 200)).then((value) =>Provider.of<MovieProvider>(context,listen: false).getGenreById()
    );
    Future.delayed(Duration(milliseconds: 200)).then((value) =>Provider.of<MovieProvider>(context,listen: false).getGenre()
    );
    Future.delayed(Duration(milliseconds: 200)).then((value) =>Provider.of<MovieProvider>(context,listen: false).getTrendingPerson()
    );
    Future.delayed(Duration(seconds: 5)).then((value) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>MyHomePage()
      ),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/poster.jpg',fit: BoxFit.cover,),
    );
  }
}

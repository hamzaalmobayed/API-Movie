import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.white24,
          offset: Offset(0, 2.0),
          blurRadius: 10.0,
        )
      ]),
      child: AppBar(
        shape: Border(bottom: BorderSide(color: Colors.white, width: 1)),
        backgroundColor: Colors.black,
        toolbarHeight: 80,
        elevation: 15,
        centerTitle: true,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'Movies-db'.toUpperCase(),
          style: Theme.of(context).textTheme.caption.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'muli',
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}

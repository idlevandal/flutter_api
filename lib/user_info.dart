import 'package:flutter/material.dart';
import 'package:practice_api/models/user.dart';

class UserInfo extends StatelessWidget {

//  final Map data = {};

  @override
  Widget build(BuildContext context) {

    final User user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('User Info'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
//                              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                Theme.of(context).primaryColorDark,
                Theme.of(context).accentColor,
              ],
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              new BoxShadow(
                  color: Colors.black38,
                  offset: new Offset(3.0, 3.0),
                  blurRadius: 10.0)
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyText(text: '${user.id}. ${user.name}'),
              MyText(text: 'Email: ${user.email.toLowerCase()}'),
              MyText(text: 'Ph: ${user.phone}'),
              MyText(text: 'Username: ${user.userName}'),
              MyText(text: 'City: ${user.city}'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class MyText extends StatelessWidget {
  final String text;

  MyText({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 30.0),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
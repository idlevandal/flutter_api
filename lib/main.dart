import 'package:flutter/material.dart';
import 'package:practice_api/services/user_service.dart';
import 'package:practice_api/models/user.dart';
import 'package:practice_api/user_info.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        '/userInfo': (context) => UserInfo(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {

  Future<List<User>> getUsersFromApi(BuildContext context) async {
    return await getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Users'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: FutureBuilder(
          future: getUsersFromApi(context),
          builder: (context, data) {
            if (data.hasData) {
              List<User> myUsers = data.data;
              return ListView.builder(
                  itemCount: myUsers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
//                        color: Colors.blue.shade200,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: LinearGradient(
                              // Where the linear gradient begins and ends
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              // Add one stop for each color. Stops should increase from 0 to 1
//                              stops: [0.1, 0.5, 0.7, 0.9],
                              colors: [
                                // Colors are easy thanks to Flutter's Colors class.
                                Colors.blue.shade700,
                                Color(0xff42a5f5),
                              ],
                            ),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.person, color: Colors.grey.shade800,),
                            title: Text(
                                '${myUsers[index].name}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            subtitle: Text(myUsers[index].city),
                            trailing: Icon(Icons.info_outline, color: Colors.white),
                            onTap: () {
//                              print(myUsers[index]);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserInfo(),
                                  settings: RouteSettings(
                                    arguments: myUsers[index],
                                  )
                                )
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                  child: SpinKitWave(
                    color: Theme.of(context).primaryColor,
                    size: 50.0,
                  )
              );
            }
          },
        ),
      ),
    );
  }

}


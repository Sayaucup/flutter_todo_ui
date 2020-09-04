import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 400,
            height: 400,
            child: Image.asset(
              'img/note_list.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Text(
              'Todos',
              style: TextStyle(
                  color: Color(0xff6c63ff),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          DraggableScrollableSheet(
              maxChildSize: 0.85,
              initialChildSize: 0.3,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff6c63ff),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              'Task No $index',
                              style: TextStyle(
                                  color: Colors.grey[200],
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'This is the details of task No $index',
                              style: TextStyle(color: Colors.grey[300]),
                            ),
                            trailing: Icon(
                              Icons.check_circle_outline,
                              color: Colors.greenAccent,
                              size: 15,
                            ),
                            isThreeLine: true,
                          );
                        },
                        controller: scrollController,
                        itemCount: 11,
                      ),
                    ),
                    Positioned(
                      child: FloatingActionButton(
                        onPressed: () {
                          print('object');
                        },
                        child: Icon(
                          Icons.add,
                          color: Color(0xff6c63ff),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      top: -20,
                      right: 30,
                    )
                  ],
                );
              })
        ],
      ),
    );
  }
}

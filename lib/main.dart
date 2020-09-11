import 'package:flutter/material.dart';
import 'package:flutter_networking/respository.dart';

import 'package:flutter_networking/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Networking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Networking'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _jobController = TextEditingController();

  Respository _respository = Respository();
  UserModel _user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
              ),
              TextField(
                controller: _jobController,
              ),
              RaisedButton(
                onPressed: () async {
                  print('hit');
                  String name = _nameController.text;
                  String job = _jobController.text;

                  UserModel user = await _respository.postUser(name, job);
                  setState(() {
                    _user = user;
                  });
                },
                child: Text('SEND REQUEST'),
                color: Colors.amber,
              ),
              SizedBox(height: 20),
              _user == null
                  ? Container()
                  : Container(
                      child: Text(
                          'Response: ${_user.name}, ${_user.id} was successfully created at ${_user.createdAt.toIso8601String()}'),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './models/api_models.dart';
import './api_manager/api_manager.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Data> _checkData;
  List<String> _texts = [
    "InduceSmile.com",
    "Flutter.io",
    "google.com",
    "youtube.com",
    "yahoo.com",
    "gmail.com"
  ];
  List<bool> _isChecked;
  @override
  void initState() {
    super.initState();
    _checkData = API_Manager().getData();
    _isChecked = List<bool>.filled(_texts.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Container(
        child: FutureBuilder<Data>(
          future: _checkData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.entries.length,
                itemBuilder: (context, index) {
                  var entries = snapshot.data.entries[index];
                  return ListTile(
                    title: Text(entries.api),
                    trailing: Checkbox(
                      value: entries.https,
                      onChanged: (val) {
                        setState(
                          () {
                            _isChecked[index] = val;
                          },
                        );
                      },
                    ),
                  );
                },
              );
            } else {
              return Container(
                child: Text("Nodata"),
              );
            }
          },
        ),
      ),
    );
  }
}

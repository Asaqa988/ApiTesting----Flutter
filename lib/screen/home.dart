import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<dynamic> myList = [];

class _HomePageState extends State<HomePage> {
  String FullURL = "https://reqres.in/api/users?page=2";

  void getAllData() async {
    Uri MyURL = Uri.parse(FullURL);

    http.Response MyRESPONSE = await http.get(MyURL);

    Map<String, dynamic> ResponseData = jsonDecode(MyRESPONSE.body);
    myList.add(ResponseData);
  }

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (context, i) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "${myList[0]["data"][0]["email"]}",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

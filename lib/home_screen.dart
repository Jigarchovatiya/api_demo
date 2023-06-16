import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ApiDemoModel> apiDemoModel = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("API demo"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              height: 150,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "User Id : ${apiDemoModel[index].userId}",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Text(
                    "Id : ${apiDemoModel[index].id}",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Text(
                    "Title : ${apiDemoModel[index].title}",
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Text(
                    "Body : ${apiDemoModel[index].body}",
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Future<List<ApiDemoModel>> getData() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    var data = jsonDecode(
      response.body.toString(),
    );
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        apiDemoModel.add(ApiDemoModel.fromJson(index));
      }
      return apiDemoModel;
    } else {
      return apiDemoModel;
    }
  }
}

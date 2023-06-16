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
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "API demo",
          style: TextStyle(
            decoration: TextDecoration.underline,
            decorationColor: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: apiDemoModel.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    padding: const EdgeInsets.all(20),
                    height: 150,
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "User Id : ${apiDemoModel[index].userId}",
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        Text(
                          "Id : ${apiDemoModel[index].id}",
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        Text(
                          "Title : ${apiDemoModel[index].title}",
                          maxLines: 1,
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        Text(
                          "Body : ${apiDemoModel[index].body}",
                          maxLines: 1,
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            );
          }
        },
      ),
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

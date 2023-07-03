import 'dart:convert';

import 'package:api_demo/res/constants/app_colors.dart';
import 'package:api_demo/res/global/media_query.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/models/user_model.dart';
import '../../res/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Dio dio = Dio();

  List<UserModelList> userModelList = [];
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
      body: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(height(context) / 50),
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(
                height(context) / 50,
              ),
            ),
            child: ListTile(
              onTap: () {},
              leading: Text("1."),
              title: Text("jigar"),
              subtitle: Text("Chovatiya"),
            ),
          );
        },
      ),
    );
  }

  getUserData() async {
    Response response;

    response = await dio.get(
      '${Constant.baseUrl}/users',
    );
    debugPrint(response.data.toString());
    userModelList = userModelListFromJson(jsonEncode(response.data));
    setState(() {});
    debugPrint("userModelList --> ${userModelList[0].name}");
  }
}

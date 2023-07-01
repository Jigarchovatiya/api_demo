import 'package:api_demo/res/constants/app_colors.dart';
import 'package:api_demo/res/global/media_query.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            margin: EdgeInsets.all(height(context) / 30),
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(
                height(context) / 10,
              ),
            ),
            child: ListTile(
              leading: Text("1."),
              title: Text("jigar"),
              subtitle: Text("Chovatiya"),
            ),
          );
        },
      ),
    );
  }
}

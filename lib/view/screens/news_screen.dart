import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('News',
        style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

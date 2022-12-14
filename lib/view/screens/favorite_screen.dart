import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Favourite',
          style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

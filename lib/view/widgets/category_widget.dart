import 'dart:math';

import 'package:flutter/material.dart';

import '../../model/categories_model.dart';

class CategoryWidget extends StatelessWidget {
  CategoryModel ?model;
   CategoryWidget({Key? key,required this.model }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: mediaQuery.height / 12,
          width: mediaQuery.width / 6,
          decoration:  BoxDecoration(
              color:  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              borderRadius:
              const BorderRadius.all(Radius.circular(10))),
        ),
         Text(
            '${model!.name}',
          style: const TextStyle(fontSize: 16),
        )
      ],
    );

  }
}

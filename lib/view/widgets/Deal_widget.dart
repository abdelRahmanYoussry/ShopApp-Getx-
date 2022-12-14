import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shop_app_task/controller/getx_controller.dart';

import '../../model/Deal_model.dart';
import '../styles/style.dart';

class DealWidget extends StatelessWidget {
  DealModel ?model;
  bool ? isFavourite;
  bool? inCart;
  int?index;
   DealWidget({Key? key,required this.model,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return  GetBuilder<Controller>(builder:(controller){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            // alignment: AlignmentDirectional.bottomStart,
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Container(
                  height: mediaQuery.height / 7,
                  width: mediaQuery.width / 4,
                  decoration:  BoxDecoration(
                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      borderRadius:
                      const BorderRadius.all(const Radius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: IconButton(onPressed: (){
                controller.changeProductFavourite(index: index!);
                },
                    padding: EdgeInsets.zero,
                    icon: model!.isFavourite!? const Icon(FontAwesomeIcons.heartCirclePlus,size: 16,
                      color: Colors.white,):const Icon(FontAwesomeIcons.heart,size: 12,)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: IconButton(onPressed: (){
                    controller.addToCart(index: index!);
                  },
                      padding: EdgeInsets.zero,
                      icon: model!.inCart!?  Icon(FontAwesomeIcons.cartPlus,size: 16,
                        color: Colors.white,):Icon(FontAwesomeIcons.plus)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 2.0, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  '${model!.name}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                const SizedBox(height: 10,),
                Text(
                  'Pieces: ${model!.availableQuantity}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined,size: 16,),
                    const SizedBox(width: 10,),
                    Text(
                      '${model!.address}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      '\$ ${model!.currentPrice}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                          fontSize: 18),
                    ),
                    const SizedBox(width: 20,),
                    Text(
                      ' \$ ${model!.oldPrice}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

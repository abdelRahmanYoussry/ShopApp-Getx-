import 'dart:math';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shop_app_task/controller/getx_controller.dart';

import '../styles/style.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return GetBuilder<Controller>(builder: (controller){
      // List cartList=controller.inCartItems;
      return Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: backGroundColor,
          title: Row(
            children: [
              Container(
                width: mediaQuery.width / 2.5,
                height: mediaQuery.height / 22,
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(120),
                      bottomRight: Radius.circular(5),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    children: const [
                      Icon(Icons.location_on_outlined),
                      Text(
                        'Mustafa st',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              const Icon(
                FontAwesomeIcons.circle,
                color: Colors.black,
                size: 40,
              )
            ],
          ),

      ),
        body:ConditionalBuilder(
          fallback: (context)=>const Center(child: Text('No Items Added To Cart ',
              style:TextStyle(fontSize: 33,fontWeight: FontWeight.bold) ),),
          condition: controller.inCartItems.isNotEmpty,
          builder: (context)=>Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
            child: ListView.separated(
                itemBuilder: (context,index)=>Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Container(
                        height: mediaQuery.height / 12,
                        width: mediaQuery.width / 5,
                        decoration:  BoxDecoration(
                            color:  Colors.primaries[Random().nextInt(Colors.primaries.length)],
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          children: [
                             Text('${controller.inCartItems[index].name}'),
                            const SizedBox(height: 5,),
                            Text('IceCream Cons: ${controller.inCartItems[index].availableQuantity}',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              '\$ ${controller.inCartItems[index].currentPrice!*controller.inCartItems[index].quantityInCart!.toInt()}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:  TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                  fontSize: 18),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: (){
                        controller.removeFromQuantityInCart(name: controller.inCartItems[index].name);
                        },
                            icon:  const Icon(FontAwesomeIcons.squareMinus,
                              size: 35,
                              color: Colors.blue,)),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text('${controller.inCartItems[index].quantityInCart}',
                            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                        ),
                        IconButton(onPressed: (){
                          controller.addQuantityInCart(index: index,name:controller.inCartItems[index].name );
                        },
                            icon: const Icon(FontAwesomeIcons.squarePlus,
                              size: 35,
                              color: Colors.blue,))
                      ],
                    )
                  ],
                ),
                separatorBuilder: (context,index)=>const SizedBox(height: 50,),
                itemCount: controller.inCartItems.length),
          ),
      ) ,
      );

    });
  }
}

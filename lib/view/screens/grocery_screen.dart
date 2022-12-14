import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shop_app_task/controller/getx_controller.dart';
import 'package:shop_app_task/view/styles/style.dart';
import 'package:shop_app_task/view/widgets/Address_widget.dart';
import 'package:shop_app_task/view/widgets/Deal_widget.dart';
import 'package:shop_app_task/view/widgets/TextFormField.dart';
import 'package:shop_app_task/view/widgets/category_widget.dart';

import '../../model/Address_model.dart';
import '../../model/Deal_model.dart';
import '../../model/categories_model.dart';

class GroceryScreen extends StatelessWidget {
  GroceryScreen({Key? key}) : super(key: key);
  var searchTextEditController = TextEditingController();
  List<AddressModel> addressList = [
    AddressModel('Home Address', 'Mustafa st, No2 \nStreet x12'),
    AddressModel('Office Address', 'Axis istanbul,B2 Bloc\nfloor 2,office||'),
  ];
  List<CategoryModel> categoryList=[
    CategoryModel('Steak'),
    CategoryModel('vegetables'),
    CategoryModel('Beverages'),
    CategoryModel('Fish'),
    CategoryModel('Juice'),
    CategoryModel('Chicken'),
  ];


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return GetBuilder<Controller>(
        builder: (controller)=>Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
          child: Column(
            children: [
              MyTextFormField(
                  readOnly: false,
                  control: searchTextEditController,
                  type: TextInputType.text,
                  isPassword: false,
                  borderColor: Colors.grey.withOpacity(0.3),
                  labelColor: Colors.black,
                  textColor: Colors.black,
                  prefix: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  label: 'Search in Thousands of Products',
                  backgroundColor: Colors.grey.withOpacity(0.1)),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: mediaQuery.height/10,
                width: mediaQuery.width,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>AddressWidget(model: addressList[index]),
                    separatorBuilder:(context,index)=>const SizedBox(
                      width: 20,
                    ),
                    itemCount: addressList.length),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Explore by Category',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const Spacer(),
                  Text(
                    'see All (36)',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: mediaQuery.height/8,
                width: mediaQuery.width,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>CategoryWidget(model: categoryList[index]),
                    separatorBuilder:(context,index)=>const SizedBox(
                      width: 20,
                    ),
                    itemCount: categoryList.length),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Deals of The day',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: mediaQuery.height/6,
                width: mediaQuery.width,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>DealWidget(model: controller.dealList[index],index: index,),
                    separatorBuilder:(context,index)=>const SizedBox(
                      width: 20,
                    ),
                    itemCount: controller.dealList.length),
              ),
              Container(
                width: double.infinity,
                height: mediaQuery.height/5,
                decoration:  BoxDecoration(
                  color: mainColor.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5,),
                        Text('Mega',
                          style: TextStyle(color: mainColor,fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5,),
                        const Text('WHOPPER',
                          style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,
                              fontSize: 30
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$ 17',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:  TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                  fontSize: 22),
                            ),
                            const SizedBox(width: 20,),
                            const Text(
                              ' \$ 32',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text('* Available until 24 December 2022 ',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    )



    );
  }
}

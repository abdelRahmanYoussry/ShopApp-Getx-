import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_app_task/view/screens/cart_screen.dart';
import 'package:shop_app_task/view/screens/favorite_screen.dart';
import 'package:shop_app_task/view/screens/grocery_screen.dart';
import 'package:shop_app_task/view/screens/news_screen.dart';
import 'package:shop_app_task/view/styles/style.dart';

import '../../controller/getx_controller.dart';

class LayoutScreen extends StatelessWidget {
   LayoutScreen({Key? key}) : super(key: key);
  List<Widget> screensList=[
      GroceryScreen(),
     const NewsScreen(),
    const FavouriteScreen(),
     CartScreen(),
  ];
  List<IconData> iconsList=[
    FontAwesomeIcons.store,
    FontAwesomeIcons.bell,
    FontAwesomeIcons.heart,
    FontAwesomeIcons.wallet,
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(builder: (controller){
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: IndexedStack(
            index: controller.bottomNavBarCurrentIndex,
            children: screensList,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          backgroundColor: mainColor,
          isExtended: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 0),
            child: Column(children:  [
              // Spacer(),
              Text('\$${controller.totalPrice}'),
              SizedBox(height: 5,),
              // Spacer(),
              Align(
                  alignment: Alignment.center,
                  child: Icon(FontAwesomeIcons.cartShopping)),

            ],),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          activeIndex: controller.bottomNavBarCurrentIndex,
          icons: iconsList,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          elevation: 0.1,
          activeColor: mainColor,
          borderWidth: double.infinity,
          backgroundColor:Colors.white.withOpacity(0.5) ,
          onTap: controller.changeBottomNavBarIndex
        ),
      );
    });
  }
}

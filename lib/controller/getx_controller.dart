import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/Deal_model.dart';

class Controller extends GetxController{
   var bottomNavBarCurrentIndex=0;

  void changeBottomNavBarIndex(int index){
    bottomNavBarCurrentIndex=index;
    print('${bottomNavBarCurrentIndex}Current index');
    update();
  }
   List favouriteItems=[];
   List<DealModel> inCartItems=[];
   List<DealModel> dealList=[
     DealModel(name: 'Summer Sun ice Cream Pack ', availableQuantity:   5,
         address:  '10 Minutes Away', currentPrice:  10, oldPrice:  14,
         inCart:  false, isFavourite:  false,id: 0,quantityInCart: 1),
     DealModel( name: 'Summer Sun ice Cream Pack2 ',availableQuantity: 10,
         address: '10 Minutes Away', currentPrice: 8,quantityInCart: 1,
         oldPrice: 18,inCart:  false,isFavourite: false,id: 1),
     DealModel(name: 'Summer Sun ice Cream Pack3 ',availableQuantity:   15,
         address: '10 Minutes Away',currentPrice: 7,oldPrice:15,inCart: false,
         quantityInCart: 1,
         isFavourite: false,id: 2),
     DealModel(name:'Summer Sun ice Cream Pack4 ',availableQuantity: 20,
         address:'10 Minutes Away',currentPrice:  4,oldPrice: 12,
         inCart: false, isFavourite:  false,id: 3,quantityInCart: 1),
     DealModel( name: 'Summer Sun ice Cream Pack5 ', availableQuantity:  25,
         address:  '10 Minutes Away',currentPrice:   7, oldPrice:  17,
         isFavourite:  false,inCart:  false,id: 4,quantityInCart: 1),
   ];

  void changeProductFavourite({required int index}){
    // favouriteItems.clear();
   dealList.forEach((element) {
      if(index==element.id){
        element.isFavourite=!element.isFavourite!;
        if(element.isFavourite==true) {
          favouriteItems.add(element);
        } else {
          favouriteItems.remove(element);
        }
        update();
      }

   });

  }


   void addToCart({required int index}){
    // inCartItems.clear();
     dealList.forEach((element) {
       if(index==element.id){
         element.inCart=!element.inCart!;
         if(element.inCart==true){
           inCartItems.add(element);
           totalPrice=totalPrice+element.quantityInCart!*element.currentPrice!.toInt();
           print(inCartItems.length.toString()+'inside the incart list');
         }else{
           inCartItems.remove(element);
           print(inCartItems.length.toString()+'remove the incart list');
         }

         update();
       }

     });

   }

   // int quantityInCart=1;
  int totalPrice=0;
   void addQuantityInCart({int? index,String ?name}){
     inCartItems.forEach((element) {
       if(name!.contains(element.name!)){
         totalPrice=totalPrice+element.currentPrice!.toInt();
         element.quantityInCart=element.quantityInCart!+1 ;
         print(element.quantityInCart);
         update();

       }
       // if(index==element.id){
       //   element.quantityInCart=element.quantityInCart!+1 ;
       //   print(element.quantityInCart);
       //
       //
       //   // addToCart(index: index!);
       // }

     });
    // quantityInCart++;

   }
   void removeFromQuantityInCart({String ?name}){
     inCartItems.forEach((element) {
       if(name!.contains(element.name!)){
         totalPrice=totalPrice-element.currentPrice!.toInt();
         element.quantityInCart=element.quantityInCart!-1 ;

         print(element.quantityInCart);
         update();

       }
     update();
   });

}}
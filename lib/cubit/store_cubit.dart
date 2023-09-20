
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storeapp/cubit/store_state.dart';
import 'package:storeapp/screens/ctegory_screen.dart';
import 'package:storeapp/screens/favorite_screen.dart';
import 'package:storeapp/screens/home_screen.dart';

import '../models/product_model.dart';

class storCubit extends Cubit<storeState>{
  storCubit(): super(InatialState());
  List<productModel>favList=[];
  int currentIndex=0;

void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(newBottonNavState());
  }
 

  Widget getCurrentScreen() {
    switch (currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return categoryScreen();
      case 2:
        return favScreen();
      default:
        return HomeScreen();
    }
  }
  Map<int,bool>favorits={};
  void isProductFavorite(productModel productId) async{
    productId.fav=!productId.fav;
    if(!productId.fav && favList.contains(productId)){
      favList.remove(productId);
    }
    if(productId.fav){
      favList.add(productId);
    }
    favorits.addAll({
        productId.id:productId.fav,
      });
    emit(changefavState());

  }



   
} 
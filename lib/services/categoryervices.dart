import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class categorySrevices{

  Future<List<productModel>> getCategory({required String category})async{
   List<dynamic>data= await Api().get(url: 'https://fakestoreapi.com/products/category/$category');
   
List<productModel> prouductList=[];
for(int i=0;i<data.length;i++){
  prouductList.add(productModel.fromJson(data[i]));
}
return prouductList;
  }
}
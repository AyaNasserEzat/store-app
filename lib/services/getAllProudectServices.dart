import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class AllProudctSrevices{

  Future<List<productModel>> getAllProudects()async{
   List<dynamic>data= await Api().get(url: 'https://fakestoreapi.com/products');
   
List<productModel> prouductList=[];
for(int i=0;i<data.length;i++){
  prouductList.add(productModel.fromJson(data[i]));
}
return prouductList;
  }
}
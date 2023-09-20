import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/screens/ctegory_screen.dart';
import 'package:storeapp/services/getAllProudectServices.dart';

import '../services/categoryervices.dart';
import '../widgets/custom_card.dart';

class CategoryProduct extends StatelessWidget {
   CategoryProduct({super.key,required this.category});
  String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                  IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:Icon(Icons.arrow_back,color: Colors.black,)),
              Text(
                'New Trend',
                style: TextStyle(color: Colors.black),
              ),
              Spacer(),
              Icon(
                Icons.shopping_cart,
                color: Colors.black,
              )
            ],
          ),
        ),
        body: 
        Padding(
          padding: const EdgeInsets.only(top:60.0),
          child: FutureBuilder<List<productModel>>(
            future:categorySrevices().getCategory(category: category) ,
            builder: (context, snapshot) {
          if(snapshot.hasData){
            List<productModel> products=snapshot.data!;
            return GridView.builder(
            clipBehavior: Clip.none,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
              crossAxisSpacing: 10,
                  mainAxisSpacing: 100
                    ),
                    itemCount: snapshot.data!.length,
              itemBuilder: (context, indx) {
    
      {      return CustomCard(product: products[indx],);}
              });}
              else{
                return Center(child: CircularProgressIndicator());
              }
          },),
        

        ),
    );
  }}

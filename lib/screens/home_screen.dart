
import 'package:flutter/material.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/getAllProudectServices.dart';
import '../widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
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
            future:AllProudctSrevices().getAllProudects() ,
            builder: (context, snapshot) {
            if(snapshot.hasData){
               List<productModel> products= snapshot.data!;
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
                return  CustomCard(product: products[indx],);
              });}
              else{
                return Center(child: CircularProgressIndicator());
              }
          },),
        

        ),
    );
  }}

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubit/store_cubit.dart';
import 'package:storeapp/cubit/store_state.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/screens/update_product_page.dart';


class CustomCard extends StatelessWidget {
   CustomCard({super.key,required this.product});
productModel product;
List<productModel>favList=[];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<storCubit,storeState>(builder: (context,state){
       return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 150,width: 200,
              child: GestureDetector(
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return UpdateProductPage(product:product);
                    }));
                },
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('${product.title.substring(0,8)}',style: TextStyle(color: Colors.grey,fontSize: 16),),
                      SizedBox(height: 8,),
                      Row(children: [
                        Text(r'$' '${product.price.toString()}',style: TextStyle(color: Colors.black,fontSize: 16),),
                        Spacer(),
                      IconButton(
                        onPressed: (){
                   BlocProvider.of<storCubit>(context).isProductFavorite(product);
                       
                        },
                       icon: 
                       Icon(
              
                BlocProvider.of<storCubit>(context).favorits[product.id]==true ?Icons.favorite:Icons.favorite_outline, size: 27,
                    color:    BlocProvider.of<storCubit>(context).favorits[product.id]==true?Colors.red:null,
                    
                       )),
                      
                      ],)
                    ],),
                  ),
                ),
              ),

            ),
          Positioned(
            
            left: 100,
            top: -50,
             child: Image.network(product.image,height: 90,width: 90,)),
          ],
        );
    });
   
  }
}
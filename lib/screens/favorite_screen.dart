import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/store_cubit.dart';
import '../cubit/store_state.dart';
import '../models/product_model.dart';
import '../widgets/custom_card.dart';

class favScreen extends StatelessWidget {
   favScreen({super.key,});
//List<productModel>?favList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              Text(
                'favorites',
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
      body:BlocBuilder<storCubit,storeState>(builder: (context, state) {
        return  Padding(
          padding: const EdgeInsets.only(top:60.0),
          child: GridView.builder(
              clipBehavior: Clip.none,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                crossAxisSpacing: 10,
                    mainAxisSpacing: 100
                      ),
                      itemCount:   BlocProvider.of<storCubit>(context).favList.length,
                itemBuilder: (context, indx) {
                  return  CustomCard(product:BlocProvider.of<storCubit>(context).favList[indx],);
                }),
        );
      },)
    );
  }
}
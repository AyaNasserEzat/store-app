import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubit/store_cubit.dart';
import 'package:storeapp/cubit/store_state.dart';
import 'package:storeapp/screens/ctegory_screen.dart';
import 'package:storeapp/screens/favorite_screen.dart';
import 'home_screen.dart';

class bottonNavigateScreen extends StatelessWidget {
  const bottonNavigateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<storCubit,storeState>(builder: (context,state){
      return  Scaffold(
      body: BlocProvider.of<storCubit>(context).getCurrentScreen(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: BlocProvider.of<storCubit>(context).currentIndex,
          onTap: (indx) {
            BlocProvider.of<storCubit>(context).changeBottomNavBar(indx);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'favorites'),
          ]),
    );
    });
  }
}

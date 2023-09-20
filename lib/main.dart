import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubit/store_cubit.dart';
import 'package:storeapp/screens/bottonNvigation.dart';
import 'package:storeapp/screens/home_screen.dart';
import 'package:storeapp/screens/update_product_page.dart'
;

void main()async {

     runApp( 
       BlocProvider(
      create: (context) => storCubit(),//..getfav(),
      child:
      const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        /*routes: {
        'bottonNavigateScreen' : (context) => bottonNavigateScreen(),
        UpdateProductPage.id : (context) => UpdateProductPage(),
        
      },
      initialRoute: 'bottonNavigateScreen',*/
      home: bottonNavigateScreen(),
    );
  }
}
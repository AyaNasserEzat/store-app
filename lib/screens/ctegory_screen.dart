import 'package:flutter/material.dart';
import 'package:storeapp/screens/category_products_screen.dart';
import 'package:storeapp/services/getAllCategoryServices.dart';


class categoryScreen extends StatelessWidget {
  const categoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon:Icon(Icons.arrow_back,color: Colors.black,)),
            Text(
              ' Category',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: FutureBuilder<List<dynamic>?>(
          future: AllCatergoryServices().getAllCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic>? categorys = snapshot.data!;
              List<String>? images = [
                "assets/images/elec.jpg",
                'assets/images/Jewellery.jpg',
                "assets/images/mens.jpeg",
                "assets/images/woman1.jpg",
              ];
              return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100),
                      itemCount: snapshot.data!.length,
                  itemBuilder: (context, indx) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CategoryProduct(
                                  category: categorys[indx]);
                            }));
                          },
                          child: Container(
                              height: 120,
                              width: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        images[indx])),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                //  alignment: Alignment.bottomCenter,
                                child: Text(
                                  categorys[indx],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

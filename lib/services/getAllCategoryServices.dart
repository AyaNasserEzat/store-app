import '../helper/api.dart';

class AllCatergoryServices {
  Future<List<dynamic>?> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}

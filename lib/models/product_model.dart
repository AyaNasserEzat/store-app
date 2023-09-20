/*class productModel {
  final dynamic id;
  final String title;
  final String price;
  final String description;
  final String image;
  final String category;
  final ratingModel? ratingmodel;
  productModel(
      {
         required this.id,
        required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category,
      required this.ratingmodel,
    });

  factory productModel.fromJson( jsonData) {
    return productModel(id: jsonData['id'],
        title: jsonData['title'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        category: jsonData['category'],
        ratingmodel:jsonData['rating']==null?null: ratingModel.fromJson(jsonData['rating']));
  }
}

class ratingModel {
  final dynamic rate;
  final int count;
  ratingModel({required this.rate, required this.count});
  factory ratingModel.fromJson( jsonData) {
    return ratingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}*/

class productModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final RatingModel? rating;
  final String category;
  bool fav=false;
  productModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.price,
      required this.description,
      required this.image,
      required this.rating,fav});
Map<String,dynamic>toJson()=>{
 'id':id,
 'title':title,
 'category':category,
 'price':price,
 'description':description,
 'image':image,
 'rating':rating?.toJson(),
};
  factory productModel.fromJson(jsonData) {
    return productModel(
        id:jsonData['id'],
        title: jsonData['title'],
        category: jsonData['category'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        rating: jsonData['rating'] == null
            ? null
            : RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
  Map<String, dynamic> toJson() =>
     {
      'rate': rate,
      'count': count,
    };
  
}

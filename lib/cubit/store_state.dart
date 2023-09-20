
import 'package:storeapp/models/product_model.dart';

abstract class storeState {}

class InatialState extends storeState{}
class newBottonNavState extends storeState{}
class changefavState extends storeState{}
class getfavState extends storeState{
  final List<productModel> favproudct;
getfavState(this.favproudct);
}
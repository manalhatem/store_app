import 'package:store_app/helper/api.dart';
import 'package:store_app/models/all_product_model.dart';
class AllProductServices{


 Future<List<AllProductModel>> getAllProducts() async{
   List<dynamic> data=await Api().get(url: 'https://fakestoreapi.com/products');

   List <AllProductModel> productsList=[];

   for (var i = 0; i < data.length; i++) {
    productsList.add(AllProductModel.fromJson(data[i]));
   }
   return productsList;
  

  }
  
}
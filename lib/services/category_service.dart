import 'package:store_app/helper/api.dart';
import 'package:store_app/models/all_product_model.dart';
class CategoryService{

   Future<List<AllProductModel>> getProductByCategory({required String categoryName})async{
    List<dynamic> data=await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');
  
    List<AllProductModel> productscat=[];

    for (var i = 0; i < data.length; i++) {
      productscat.add(AllProductModel.fromJson(data[i]));
      
    }
    return productscat;
  }
  
}
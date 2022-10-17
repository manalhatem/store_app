import 'package:store_app/helper/api.dart';
import 'package:store_app/models/all_product_model.dart';

class UpdateProductService{

  Future<AllProductModel> updateProduct({required int id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category})async{
  Map<String,dynamic> data= await Api().put(url: 'https://fakestoreapi.com/products/$id',body: {
       'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category
    });
    return  AllProductModel.fromJson(data);
  }
}
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/all_product_model.dart';
import 'package:store_app/services/update_product.dart';
import '../widgets/custom_textfield.dart';

class UpdatePage extends StatefulWidget {
   UpdatePage({Key? key}) : super(key: key);
  static String id='Update Product';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? productName,desc,image,price;

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
      AllProductModel product=ModalRoute.of(context)!.settings.arguments as AllProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title:const Text('Update Product',style: TextStyle(color: Colors.black),)),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomFormTextField(hintText: 'Enter Product Name ',onChanged: (value){productName=value;},),
                  const SizedBox(height: 15,),
                  CustomFormTextField(hintText: 'Enter Product Desc ',
                  onChanged: (value){desc=value;},),
                  const SizedBox(height: 15,),
                  CustomFormTextField(hintText: 'Enter Product Price ',
                  onChanged: (value){price=value;},
                  type: TextInputType.number,),
                  const SizedBox(height: 15,),
                  CustomFormTextField(hintText: 'Enter Product Image ',
                  onChanged: (value){
                    image=value;
                  },),
                  const SizedBox(height: 60,),
            
                  MaterialButton(
                    minWidth: double.infinity,
                    color: Colors.blue
                    ,onPressed: ()async{
                      isLoading=true;
                      setState(() {});
                      try {    
                      await updateProduct(product);
                      print('Success');
                      } catch (e) {
                        print(e.toString());
                      }
                      isLoading=false;
                        setState(() { });
                        
                    },
                    
                    child:const Text('Update',style: TextStyle(fontSize: 18,color: Colors.white),),)
                ],
              ),
            ),
          ),
      ),
    );
    
  }

  Future<void> updateProduct(AllProductModel product) async {
  await  UpdateProductService()
    .updateProduct(id: product.id,
     title: productName==null?product.title:productName!, 
     price:price==null?product.price.toString(): price!, 
     description:desc==null?product.description: desc!,
      image:image==null?product.image: image!, 
      category: product.category);
  }
}
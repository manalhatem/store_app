import 'package:flutter/material.dart';
import 'package:store_app/models/all_product_model.dart';
import 'package:store_app/widgets/custom_card.dart';

import '../services/all_products_service.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.black,
              )),
        ],
      ),
      body:Padding(padding:const EdgeInsets.only(right: 15,left: 15,top: 60),
      child: FutureBuilder<List<AllProductModel>>(
        future: AllProductServices().getAllProducts(),
        builder: (context,snapshot){
          //print(snapshot.data);
        if (snapshot.hasData) {
          List<AllProductModel> products=snapshot.data!;
          return  GridView.builder(
            itemCount: products.length,
        clipBehavior: Clip.none,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 75,
          crossAxisSpacing: 6,
          childAspectRatio: 1.3
          )
         , itemBuilder: (context,index){
          return  CustomCard(product:products[index]);
        });   
        }
        else{
          return const Center(child: CircularProgressIndicator());
        }
      })),
      
    );
  }

 
}


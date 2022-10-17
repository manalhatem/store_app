// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:store_app/models/all_product_model.dart';

import '../screens/update_page.dart';

class CustomCard extends StatelessWidget {

  AllProductModel product;
   CustomCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdatePage.id,arguments: product);
      },
      child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 40,
                color: Colors.grey.withOpacity(.1),
                spreadRadius: 0,
                offset:const Offset(8,8))
              ]),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title.substring(0,8),style:const TextStyle(color: Colors.grey,fontSize: 16) ,),
                      const SizedBox(height: 3,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(r'$''${product.price}',style:const TextStyle(color: Colors.black,fontSize: 14) ,),
                         const Icon(Icons.favorite,color: Colors.red,)
    
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: -50,
              child: Image.network(product.image,height: 95,width: 100,)),
          ],
        ),
    );

    
  }
}

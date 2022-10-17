import 'package:flutter/material.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_page.dart';


void main() {
  runApp(const Shop());
}
class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context)=>const HomePage(),
        UpdatePage.id:(context)=> UpdatePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}



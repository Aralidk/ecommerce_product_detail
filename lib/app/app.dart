import 'package:flutter/material.dart';
import '../feauters/product_detail/product_detail_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Case Study',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.black),
      home: const ProductDetailPage(productHandle: 'selling-plans-ski-wax'),
    );
  }
}

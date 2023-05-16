import 'package:flutter/material.dart';
import 'package:fluttertask/pages/dashboard.dart';
import 'package:fluttertask/pages/home.dart';
import 'package:fluttertask/pages/register.dart';
import 'package:fluttertask/providers/product-provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      create: (context) => ProductData(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/register': (context) => Register(),
          '/dashboard': (context) => Dashboard(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

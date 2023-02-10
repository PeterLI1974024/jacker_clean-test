import 'package:clean/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
            color: Colors.transparent,
          )),
          debugShowCheckedModeBanner: false,
          home: ListPage()),
    );
  }
}

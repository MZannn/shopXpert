import 'package:flutter/material.dart';
import 'package:shopxpert/themes/text_themes.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopXpert',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
        textTheme: textThemes,
      ),
      onGenerateRoute: (settings) => Routes().route(settings),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopxpert/blocs/category/category_bloc.dart';
import 'package:shopxpert/blocs/home/home_bloc.dart';
import 'package:shopxpert/pages/category_page.dart';
import 'package:shopxpert/pages/home_page.dart';

class Routes {
  Route route(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeBloc()..add(GetAllProducts()),
            child: const HomePage(),
          ),
        );
      case '/category':
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: settings.arguments,
          ),
          builder: (context) => BlocProvider(
            create: (context) => CategoryBloc()
              ..add(
                GetByCategory(
                  settings.arguments as String,
                ),
              ),
            child: const CategoryPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}

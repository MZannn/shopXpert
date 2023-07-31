import 'package:flutter/material.dart';
import 'package:shopxpert/blocs/home/home_bloc.dart';
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
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}

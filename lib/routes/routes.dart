import 'package:flutter/material.dart';
import 'package:shopxpert/blocs/category/category_bloc.dart';
import 'package:shopxpert/blocs/detail/detail_bloc.dart';
import 'package:shopxpert/blocs/home/home_bloc.dart';
import 'package:shopxpert/blocs/login/login_bloc.dart';
import 'package:shopxpert/blocs/navigation/navigation_bloc.dart';
import 'package:shopxpert/blocs/register/register_bloc.dart';
import 'package:shopxpert/pages/category_page.dart';
import 'package:shopxpert/pages/detail_page.dart';
import 'package:shopxpert/pages/home_page.dart';
import 'package:shopxpert/pages/login_page.dart';
import 'package:shopxpert/pages/navigation_page.dart';
import 'package:shopxpert/pages/welcome_page.dart';

class Routes {
  Route route(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterBloc(),
            child: const WelcomePage(),
          ),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBloc(),
            child: const LoginPage(),
          ),
        );
      case '/navigation':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NavigationBloc()
                  ..add(
                    const NavigationChangeScreen(
                      selectedIndex: 0,
                    ),
                  ),
              ),
              BlocProvider(
                create: (context) => HomeBloc()
                  ..add(
                    GetAllProducts(),
                  ),
              ),
            ],
            child: const NavigationPage(),
          ),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeBloc()..add(GetAllProducts()),
            child: HomePage(),
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
      case '/detail':
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: settings.arguments,
          ),
          builder: (context) => BlocProvider(
            create: (context) => DetailBloc()
              ..add(
                GetDetailProduct(
                  settings.arguments.toString(),
                ),
              ),
            child: const DetailPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}

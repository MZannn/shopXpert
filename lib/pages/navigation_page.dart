import 'package:flutter/material.dart';

import 'package:shopxpert/blocs/navigation/navigation_bloc.dart';
import 'package:shopxpert/pages/home_page.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationChangeScreenSuccess) {
            switch (state.selectedIndex) {
              case 0:
                return const HomePage();
              case 1:
                return const Scaffold();
              case 2:
                return const Scaffold();
              case 3:
                return const Scaffold();
              default:
                return const SizedBox();
            }
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationChangeScreenSuccess) {
            var navigationBloc = context.read<NavigationBloc>();
            return BottomAppBar(
              color: Colors.white,
              padding: EdgeInsets.zero,
              child: Container(
                height: 70,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        navigationBloc.add(
                          const NavigationChangeScreen(selectedIndex: 0),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            state.selectedIndex == 0
                                ? Icons.shopping_bag
                                : Icons.shopping_bag_outlined,
                            color: state.selectedIndex == 0
                                ? Colors.orange[800]
                                : Colors.grey[300],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Home",
                            style: textTheme.bodySmall!.copyWith(
                              color: state.selectedIndex == 0
                                  ? Colors.orange[800]
                                  : Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navigationBloc.add(
                          const NavigationChangeScreen(selectedIndex: 1),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            state.selectedIndex == 1
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: state.selectedIndex == 1
                                ? Colors.orange[800]
                                : Colors.grey[300],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Favorite",
                            style: textTheme.bodySmall!.copyWith(
                              color: state.selectedIndex == 1
                                  ? Colors.orange[800]
                                  : Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navigationBloc.add(
                          const NavigationChangeScreen(selectedIndex: 2),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            state.selectedIndex == 2
                                ? Icons.shopping_cart_rounded
                                : Icons.shopping_cart_outlined,
                            color: state.selectedIndex == 2
                                ? Colors.orange[800]
                                : Colors.grey[300],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Keranjang",
                            style: textTheme.bodySmall!.copyWith(
                              color: state.selectedIndex == 2
                                  ? Colors.orange[800]
                                  : Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        navigationBloc.add(
                          const NavigationChangeScreen(selectedIndex: 3),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            state.selectedIndex == 3
                                ? Icons.person
                                : Icons.person_outline_rounded,
                            color: state.selectedIndex == 3
                                ? Colors.orange[800]
                                : Colors.grey[300],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Akun",
                            style: textTheme.bodySmall!.copyWith(
                              color: state.selectedIndex == 3
                                  ? Colors.orange[800]
                                  : Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopxpert/blocs/category/category_bloc.dart';
import 'package:shopxpert/widgets/card_product.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Image.asset(
          "assets/images/logo.png",
          height: 50,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CategoryLoaded) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(
                    16,
                  ),
                  child: GridView.builder(
                    itemCount: state.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CardProduct(
                        product: state.products[index],
                      );
                    },
                  ),
                );
              }
              if (state is CategoryError) {
                return Center(
                  child: Text(state.message),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

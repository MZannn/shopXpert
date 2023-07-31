import 'package:flutter/material.dart';
import 'package:shopxpert/models/product_model.dart';
import 'package:shopxpert/widgets/rating_starts.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  8,
                ),
                height: 200 / 2,
                child: Image.network(product.image!),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${product.title}",
                    style: textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    "\$ ${product.price}",
                    style: textTheme.titleSmall,
                  ),
                  Row(
                    children: [
                      RatingStars(rate: product.rating!.rate!),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("${product.rating!.rate}"),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.orange[800],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(
                  10,
                ),
              ),
            ),
            child: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:appecomm/common/widgets/products/product_cards/product.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductInfo extends StatelessWidget {
  final Product product;
  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Iconsax.star,
                            size: 13,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            product.rate.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "(320 Reviews)",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Seller: "),
                  TextSpan(
                    text: "Aleena Mirza",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

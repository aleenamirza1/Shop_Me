import 'package:appecomm/common/widgets/products/cart/cart_tile.dart';
import 'package:appecomm/common/widgets/products/cart/checkOutBox.dart';
import 'package:appecomm/utils/constants/colors.dart';
import 'package:appecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'cart_items.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
      appBar: AppBar(
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.black
            : TColors.white,
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            icon: const Icon(Iconsax.backward),
          ),
        ),
      ),
      bottomSheet: CheckOutBox(
        items: cartItems,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) => CartTile(
          item: cartItems[index],
          onRemove: () {
            if (cartItems[index].quantity != 1) {
              setState(() {
                cartItems[index].quantity--;
              });
            }
          },
          onAdd: () {
            setState(() {
              cartItems[index].quantity++;
            });
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: cartItems.length,
      ),
    );
  }
}

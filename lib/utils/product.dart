import 'package:flutter/material.dart';
import 'package:pro_three/models/data_model.dart';
import 'package:pro_three/view_model/data_provider.dart';
import 'package:pro_three/views/detail_screen.dart';
import 'package:provider/provider.dart';

class ProductWid extends StatelessWidget {
  const ProductWid({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DataProvider(product), child: const ProductCard());
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: true);
    Product product = provider.product!;
    return SizedBox(
      width: 160,
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              createRoute(context, provider);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 2,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset(
                  product.image,
                  height: 80,
                  width: 130,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              product.name,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "\$${product.price}",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  color: Colors.white,
                  child: const Icon(
                    Icons.favorite_outline,
                    size: 20,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void createRoute(BuildContext context, DataProvider provider) {
    Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => DetailScreen(
                provider: provider,
              ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end);
            // var curve = Curves.ease;
            // var curveTween =
            //     CurveTween(curve: curve);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300)),
    );
  }
}

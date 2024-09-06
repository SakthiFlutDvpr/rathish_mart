import 'package:flutter/material.dart';
import 'package:pro_three/models/data_model.dart';
import 'package:pro_three/view_model/data_provider.dart';
import 'package:pro_three/views/cart_screen.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.provider});

  final DataProvider provider;

  @override
  Widget build(BuildContext context) {
    Product product = provider.product!;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider.value(
      value: provider,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                  size: 20,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                  size: 30,
                ))
          ],
          backgroundColor: Colors.white,
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: Colors.white,
              height: height,
              width: width,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        product.image,
                        height: height * 0.4,
                        width: width * 0.9,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.4,
                    width: width,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 25, left: 20, right: 20),
              alignment: Alignment.center,
              height: height * 0.45,
              width: width,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(65),
                      topRight: Radius.circular(65))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "\$${product.price}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "Size :",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                      children: product.size.map((e) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.red)),
                      child: Text(
                        e.toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  }).toList()),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: width * 0.5,
                      height: 50,
                      child: Consumer<DataProvider>(
                          builder: (c, v, child) => v.added == false
                              ? ElevatedButton(
                                  onPressed: () {
                                    v.addToCart();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4))),
                                  child: const Text(
                                    "AddToCart",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ))
                              : ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return CartScreen(
                                        provider: provider,
                                      );
                                    }));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4))),
                                  child: const Text(
                                    "GoToCart",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ))))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget button(BuildContext context, Product producct) {
    return Container(
        width: 150,
        height: 35,
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(18))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4))),
              child: Text("-",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white)),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Text(producct.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.red)),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 40,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4))),
              child: Text("+",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white)),
            ),
          ),
        ]));
  }
}

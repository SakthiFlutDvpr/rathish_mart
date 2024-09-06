import 'package:flutter/material.dart';
import 'package:pro_three/models/data_model.dart';
import 'package:pro_three/utils/product.dart';
import 'package:pro_three/views/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DataModel data;

  @override
  void initState() {
    super.initState();
    data = DataModel.fromJson(DataSource().data);

    debugPrint(data.productModels.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rathish Store",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: 20,
            height: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  height: 3,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  width: 15, // Half the width of the first line
                  height: 3,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.lock_clock_outlined,
                size: 28,
              ))
        ],
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        toolbarHeight: 60,
      ),
      body: Container(
          width: width,
          height: height,
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 16,
          ),
          child: data.productModels.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: data.productModels.map((productModel) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productModel.title,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Container(
                            height: 200,
                            width: width,
                            margin: const EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                var product = productModel.products[index];
                                return
                                    // GestureDetector(
                                    //     onTap: () {
                                    //       Navigator.of(context).push(
                                    //         PageRouteBuilder(
                                    //             pageBuilder: (context, animation,
                                    //                     secondaryAnimation) =>
                                    //                 DetailScreen(
                                    //                   product: product,
                                    //                 ),
                                    //             transitionsBuilder: (context,
                                    //                 animation,
                                    //                 secondaryAnimation,
                                    //                 child) {
                                    //               const begin = Offset(0.0, 1.0);
                                    //               const end = Offset.zero;
                                    //               final tween =
                                    //                   Tween(begin: begin, end: end);
                                    //               // var curve = Curves.ease;
                                    //               // var curveTween =
                                    //               //     CurveTween(curve: curve);
                                    //               final offsetAnimation =
                                    //                   animation.drive(tween);
                                    //               return SlideTransition(
                                    //                 position: offsetAnimation,
                                    //                 child: child,
                                    //               );
                                    //             },
                                    //             transitionDuration: const Duration(
                                    //                 milliseconds: 300)),
                                    //       );
                                    //     },
                                    //     child:
                                    ProductWid(
                                  product: product,
                                );
                              },
                              itemCount: productModel.products.length,
                              separatorBuilder: (_, index) {
                                return const SizedBox(
                                  width: 15,
                                );
                              },
                            ),
                          )
                        ],
                      );
                    }).toList(),
                  ),
                )
              : const SizedBox(
                  child: Center(
                  child: CircularProgressIndicator(),
                ))),
    );
  }
}

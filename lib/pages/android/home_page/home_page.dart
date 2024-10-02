import 'package:dukaan/controller/api_controller.dart';
import 'package:dukaan/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/product_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Api mutable = Provider.of<Api>(context);
    Api unmutable = Provider.of<Api>(context, listen: false);
    bool islike = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Center(
        child: (mutable.allProduct.isEmpty)
            ? Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200,
                child: Column(
                  children: List.generate(
                    5,
                    (index) => const Card(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 127,
                          ),
                        ],
                      ),
                      // child: ,
                    ),
                  ),
                ),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.5 / 5,
                ),
                itemCount: mutable.allProduct.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: size.height * 0.2,
                                width: size.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white70,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      mutable.allProduct[index].images[0],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                child: IconButton(
                                  onPressed: () {
                                    Provider.of<ProductController>(context,
                                            listen: false)
                                        .like();
                                  },
                                  icon: Provider.of<ProductController>(context)
                                          .islike
                                      ? const Icon(Icons.favorite)
                                      : const Icon(Icons.favorite_outline),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            mutable.allProduct[index].title,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '₹ ${mutable.allProduct[index].price}.00',
                            style: const TextStyle(
                                fontSize: 21, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

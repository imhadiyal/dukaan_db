import 'package:dukaan/controller/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Api mutable = Provider.of<Api>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
                itemCount: mutable.allProduct.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      color: Colors.red,
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 5,
                ),
              ),
      ),
    );
  }
}

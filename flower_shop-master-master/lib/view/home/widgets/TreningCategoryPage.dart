import 'package:flutter/material.dart';
import 'package:flower_shop/data/product_data.dart';
import 'package:flower_shop/model/product_model.dart';
import 'package:flower_shop/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';

class TreningCategoryPage extends StatelessWidget {
  const TreningCategoryPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    // Filter products based on the "Trening" category
    List treningProducts = productData
        .where((product) => product.category == 'Trening')
        .toList();

    return Scaffold(
      appBar: AppBar(
          title: Text('Home - Current Page: ${appState.currentPage}')
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: treningProducts.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: klightGrayClr,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      treningProducts[index].image,
                      height: 200,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    treningProducts[index].title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    treningProducts[index].desc,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 11, color: kgrayClr),
                  ),
                  SizedBox(height: 10),
                  Text(
                    treningProducts[index].price,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kgrayClr,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

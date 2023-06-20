import 'package:flutter/material.dart';
import 'package:flower_shop/data/product_data.dart';
import 'package:flower_shop/model/product_model.dart';
import 'package:flower_shop/utils/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';

class FavoritesCategoryPage extends StatelessWidget {
  const FavoritesCategoryPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // Filter products excluding "Rose" and "Hanover" titles
    List filteredProducts = productData
        .where((product) =>
    product.title == "Tulip" || product.title == "Rose")
        .toList();
    final appState = Provider.of<AppState>(context);
    return Scaffold(

      appBar: AppBar(
        title: Text('Current Page: ${appState.currentPage}'),
        backgroundColor: Colors.green,
      ),
      body: AlignedGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: filteredProducts.length,
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
                      filteredProducts[index].image,
                      height: 200,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        filteredProducts[index].category,
                        style: const TextStyle(
                          color: ksecondaryClr,
                          fontSize: 16,
                        ),
                      ),
                      const Icon(
                        Icons.favorite,
                        color: ksecondaryClr,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    filteredProducts[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    filteredProducts[index].desc,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 11, color: kgrayClr),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    filteredProducts[index].price,
                    style: TextStyle(
                      fontSize: 12,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Go back to the previous screen
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
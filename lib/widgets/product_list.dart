import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/widgets/product_card.dart';
import 'package:shopping_app/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'Puma',
    'Reebok',
  ];

  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
    );
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Shoe\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final label = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = label;
                      });
                    },

                    child: Chip(
                      backgroundColor: selectedFilter == label
                          ? Theme.of(context).colorScheme.primary
                          : Color.fromRGBO(245, 247, 249, 1),
                      side: BorderSide(color: Color.fromRGBO(245, 247, 249, 1)),
                      label: Text(label),
                      labelStyle: TextStyle(fontSize: 16),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 1080) {
                  return GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.75,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsPage(product: product),
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['prices'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? Color.fromRGBO(216, 240, 253, 1)
                              : Color.fromRGBO(256, 247, 249, 1),
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsPage(product: product),
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['prices'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? Color.fromRGBO(216, 240, 253, 1)
                              : Color.fromRGBO(256, 247, 249, 1),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

//layout builder is used to build the widget tree based on the constraints passed to it by parent widget
//media query is used to get the size of the screen

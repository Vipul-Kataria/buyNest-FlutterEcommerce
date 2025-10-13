import 'package:amazon_clone/commons/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/widget/single_product.dart';
import 'package:amazon_clone/features/admin/screen/add_product_screen.dart';
import 'package:amazon_clone/features/admin/services/admin_service.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  AdminService adminService = AdminService();
  @override
  void initState() {
    super.initState();
    showAllProduct();
  }

  showAllProduct() async {
    products = await adminService.fetchAllProducts(context);
    setState(() {});
  }

  deleteProduct(Product product, int index) async {
    adminService.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {
          
        });
      },
    );
  } 

  @override
  Widget build(BuildContext context) {
    return products == null
        ? Loader()
        : Scaffold(
            body: Center(
              child: GridView.builder(
                itemCount: products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final productData = products![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleProduct(image: productData.images[0]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                productData.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            IconButton(
                              onPressed: () =>deleteProduct(productData, index),
                              icon: Icon(Icons.delete_outline),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddProductScreen.routeName);
              },
              backgroundColor: GlobalVariables.selectedNavBarColor,
              tooltip: "Add a product",
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}

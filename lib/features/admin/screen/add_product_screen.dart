import 'dart:io';

import 'package:amazon_clone/commons/widgets/custom_button.dart';
import 'package:amazon_clone/commons/widgets/custom_text_field.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/services/admin_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = "/add-product";
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionNameController =
      TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminService adminService = AdminService();
  List<File> images = [];
  final _addProductKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionNameController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategories = [
    "Mobiles",
    "Appliances",
    "Essentials",
    "Books",
    "Fashion",
  ];
  String category = "Mobiles";

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  void sellProduct() {
    if (_addProductKey.currentState!.validate()&& images.isNotEmpty) {
      adminService.sellProduct(
        context: context,
        name: productNameController.text,
        description: descriptionNameController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: images,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            "Add Product",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((i) {
                          return Builder(
                            builder: (BuildContext context) =>
                                Image.file(i, fit: BoxFit.cover, height: 200),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          options: RoundedRectDottedBorderOptions(
                            dashPattern: [15, 4],
                            strokeWidth: 1,
                            strokeCap: StrokeCap.round,
                            radius: Radius.circular(10),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.folder_open, size: 40),
                                SizedBox(height: 15),
                                Text(
                                  "Select Product Images",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 10),
              CustomTextField(
                mycontroller: productNameController,
                hintText: "Product Name",
              ),
              SizedBox(height: 10),
              CustomTextField(
                mycontroller: descriptionNameController,
                hintText: "Description",
                maxLines: 6,
              ),
              SizedBox(height: 10),
              CustomTextField(mycontroller: priceController, hintText: "Price"),
              SizedBox(height: 10),
              CustomTextField(
                mycontroller: quantityController,
                hintText: "Quantity",
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double
                    .infinity, //so that jb mein dropdown bnau to bs ye options jitni jgh na le puri jgh le
                child: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  value: category,
                  items: productCategories.map((String item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (String? newVal) {
                    setState(() {
                      category = newVal!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(text: "Sell", onTap:sellProduct),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

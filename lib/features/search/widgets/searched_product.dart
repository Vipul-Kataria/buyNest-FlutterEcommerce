import 'package:amazon_clone/commons/widgets/stars.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.fitWidth,
                height: 135,
                width: 135,
              ),
              Column(
                children: [
                  Container(
                    //USED TO DISPLAY TITLE
                    width: 235,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.name,
                      style: TextStyle(fontSize: 16),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    //USED TO DISPLAY STARS
                    width: 235,
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Stars(rating: 3),
                  ),
                  Container(
                    //USED TO Price
                    width: 235,
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text("Rs. ${product.price}/-",maxLines: 2,style: TextStyle(fontSize: 18)),
                  ),
                  Container(                          //USED TO etc charge for shipping
                    width: 235,
                    padding: EdgeInsets.only(left: 10,top: 5),
                    child: Text(product.price<=500? "Deleivery charges may apply":"Eligible for FREE shipping."),
                  ),
                  Container(                          //USED TO etc charge for shipping
                    width: 235,
                    padding: EdgeInsets.only(left: 10,top: 5),
                    child: Text(product.quantity==0? "Out Of Stock":"In Stock",style: TextStyle(color: Colors.blue),),
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10, bottom: 15),
          child: const Text("Deal of the day", style: TextStyle(fontSize: 20)),
        ),
        Image.network(
          "https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHNoaXJ0fGVufDB8MHwwfHx8MA%3D%3D",
          height: 300,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15, top: 4, right: 40),
          child: Text("₹ 500/-",style: TextStyle(fontSize: 18),),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15, top: 4, right: 40),
          child: Text("Men Shirts",maxLines: 2,overflow: TextOverflow.ellipsis,),
        ),
        SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network("https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2hpcnQlMjBwbGFpbnxlbnwwfHwwfHx8MA%3D%3D",fit: BoxFit.fitWidth,height: 60,width: 100,),
              Image.network("https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2hpcnQlMjBwbGFpbnxlbnwwfHwwfHx8MA%3D%3D",fit: BoxFit.fitWidth,height: 60,width: 100,),
              Image.network("https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2hpcnQlMjBwbGFpbnxlbnwwfHwwfHx8MA%3D%3D",fit: BoxFit.fitWidth,height: 60,width: 100,),
              Image.network("https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2hpcnQlMjBwbGFpbnxlbnwwfHwwfHx8MA%3D%3D",fit: BoxFit.fitWidth,height: 60,width: 100,),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15,top: 10,bottom: 15),
          child: Text("See All",style: TextStyle(color: GlobalVariables.selectedNavBarColor,fontSize: 15,fontWeight: FontWeight.w500),),
        )
      ],
    );
  }
}

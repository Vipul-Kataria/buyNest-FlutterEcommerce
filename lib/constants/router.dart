import 'package:amazon_clone/commons/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/admin/screen/add_product_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/search/screen/search_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(builder: (_) => const BottomBar());
    case AddProductScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductScreen());
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(builder: (_) => CategoryDealsScreen(category: category),);
    case SearchScreen.routeName:
      var searchQry = routeSettings.arguments as String;
      return MaterialPageRoute(builder: (_) =>SearchScreen(searchQuery: searchQry,));

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(body: Text("Error in route Route not found")),
      );
  }
}

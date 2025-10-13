import 'package:amazon_clone/Providers/user_provider.dart';
import 'package:amazon_clone/commons/widgets/bottom_bar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/router.dart';
import 'package:amazon_clone/features/admin/screen/admin_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // ✅ import flutter_dotenv

Future<void> main() async {
  // Ensure Flutter is initialized for async operations
  WidgetsFlutterBinding.ensureInitialized();

  // Load the .env file (from project root)
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BuyNest',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: ColorScheme.light(primary: GlobalVariables.secondaryColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: (routeSettings) => generateRoute(routeSettings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == "user"
                ? const BottomBar()
                : AdminScreen()
          : const AuthScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stylejunction/signuppage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await MongoDatabase.ensureConnection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: SignupScreen(), // Set the SignupScreen as the initial page
    );
  }
}

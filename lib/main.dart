import 'package:flutter/material.dart';
import 'package:flutter_final_to_do/screens/login.dart';
import 'package:flutter_final_to_do/services/TaskProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: LoginPage(
            showRegisterPage: () {},
          )),
    );
  }
}


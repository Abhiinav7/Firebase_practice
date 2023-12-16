import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_study/database_app/editpage.dart';
import 'package:firebase_study/firebase_options.dart';
import 'package:flutter/material.dart';

import 'database_app/FirstPAge.dart';

import 'databse/databaseData.dart';
import 'databse/home.dart';
import 'auth_practice/firebase_auth.dart';
import 'firebase_storage/storage_study.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
//brightness: Brightness.light,
      appBarTheme: AppBarTheme(color: Colors.pink),
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const FirstPage(),
      // routes: {
      //   "/":(context) => FirstPage(),
      //   "/edit":(context) => EditPage()
      // },
      // initialRoute: "/",
    );
  }
}


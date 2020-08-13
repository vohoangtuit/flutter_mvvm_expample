import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_example/views/splash.dart';

import 'network/rest_client.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}
void setupLocator(){
  GetIt.I.registerLazySingleton(() => RestClient());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

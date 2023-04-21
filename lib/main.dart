import 'package:flutter/material.dart';
import 'package:the_marvel_chars/src/config/serviceLocator/service_locator.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/controllers/characters_view_controller.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/views/characters_view.dart';

void main() {
  ServiceLocator.setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel Characters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CharactersView(
        viewController: ServiceLocator.get<ICharactersViewController>(),
      ),
    );
  }
}

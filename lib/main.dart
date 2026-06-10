import 'package:flutter/material.dart';
import 'package:jaep_movies_app/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jaep_movies_app/presentation/screens/movies/home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  
  await dotenv.load(fileName: '.env');

  print(dotenv.env["MOVIEDB_KEY"]);

  runApp(
    ProviderScope(child: const MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}

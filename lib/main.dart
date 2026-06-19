import 'package:flutter/material.dart';
import 'package:jaep_movies_app/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';

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

    initializeDateFormatting();
    
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}

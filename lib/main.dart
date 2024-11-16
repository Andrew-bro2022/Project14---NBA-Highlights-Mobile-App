import 'package:flutter/material.dart';
import 'package:nba_highlights/core/theme/app_theme.dart';
import 'package:nba_highlights/core/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // TODO: Add Firebase initialization when configuration is ready
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey: "YOUR_API_KEY",
  //     appId: "YOUR_APP_ID",
  //     messagingSenderId: "YOUR_SENDER_ID",
  //     projectId: "YOUR_PROJECT_ID",
  //     databaseURL: "YOUR_DATABASE_URL",
  //   ),
  // );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NBA Highlights',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

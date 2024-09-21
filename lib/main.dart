import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventi/config/app_theme.dart';
import 'package:inventi/config/routes.dart';
import 'package:inventi/dependency_injection.dart/dependency_injection.dart';
import 'package:inventi/features/auth/presentation/pages/login.dart';
import 'package:inventi/features/home/domain/usecases/randomstring_usecase.dart';
import 'package:inventi/features/home/presentation/bloc/randomstring/random_string_bloc.dart';

import 'package:inventi/features/home/presentation/pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator(); // Initialize service locator

  runApp(const MyApp(
    initialRoute: AppRoutes.login,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    required this.initialRoute,
    super.key,
  });

  final String initialRoute;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Date : Sept 21, 2024
        // Register the bloc provider for random string
        BlocProvider(
          create: (context) => RandomStringBloc(
              getRandomStringUsecase: sl<RandomStringUsecase>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inventi Property Management',
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.login,
        routes: {
          AppRoutes.login: (context) => const LoginPage(),
          AppRoutes.homepage: (context) => const HomePage(),
        },
      ),
    );
  }
}

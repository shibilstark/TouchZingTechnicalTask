// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/application/logic/user/user_cubit.dart';
import 'package:user_app/core/color.dart';
import 'package:user_app/presentation/routes/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserCubit(),
      child: MaterialApp(
        theme: ThemeData(
            progressIndicatorTheme:
                const ProgressIndicatorThemeData(color: primaryColor),
            appBarTheme: const AppBarTheme(
                backgroundColor: primaryColor, foregroundColor: pureWhite)),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}

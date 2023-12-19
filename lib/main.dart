import 'package:finalproject/screens/authentication_screen/cubit/auth_cubit_cubit.dart';
import 'package:finalproject/screens/home_screen.dart';
import 'package:finalproject/screens/login_screen.dart';
import 'package:finalproject/screens/register_screen.dart';
import 'package:finalproject/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthCubit())],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          home:  RegisterScreen(),
        ));
  }
}

import 'package:finalproject/screens/authentication_screen/cubit/auth_cubit_cubit.dart';
import 'package:finalproject/screens/authentication_screen/cubit/auth_cubit_state.dart';
import 'package:finalproject/screens/home_screen.dart';
import 'package:finalproject/screens/register_screen.dart';
import 'package:finalproject/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else if (state is FaildToLoginState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Container(
            alignment: Alignment.center,
            height: 100,
            child: Text(
              state.message,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )));
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Center(
                child: Container(
                    height: 400,
                    width: 400,
                    child:
                        Image.asset("images/Ecommerce campaign-rafiki.png"))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(hintText: "Email"),
                      validator: (input) {
                        if (emailController.text.isNotEmpty) {
                          return null;
                        } else {
                          return "Email must be not empty";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: "Password"),
                      validator: (input) {
                        if (passwordController.text.isNotEmpty) {
                          return null;
                        } else {
                          return "Password must be not empty";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (formkey.currentState!.validate() == true) {
                          BlocProvider.of<AuthCubit>(context).login(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      minWidth: double.infinity,
                      textColor: Colors.black,
                      color: Colors.redAccent,
                      child: const Text(
                        State is LoginLoadingState ? "Loading..." : "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account? ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        const SizedBox(
                          width: 4,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          child: const Text('Create one',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    ));
  }
}

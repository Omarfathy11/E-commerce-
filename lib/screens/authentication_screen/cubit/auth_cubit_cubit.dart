import 'dart:convert';

import 'package:finalproject/screens/authentication_screen/cubit/auth_cubit_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

class AuthCubit extends Cubit<AuthStates>{
  AuthCubit() : super(AuthInitialState());

  void register({required String full_name , required String email, required String password, required String phone_number}) async{
    emit(RegisterLoadingState());
    Response response = await http.post(
        Uri.parse("https://a424-154-184-240-112.ngrok-free.app/api/signup/"),
        headers: {
          'lang': 'en',
        },
        body: {
          'full_name' : full_name,
          'email' : email ,
          'password' : password, 
          'phone_number' : phone_number
        }
        
    );
    var data = jsonDecode(response.body);
     print(response);
    if(response.statusCode == 201){
      
        debugPrint("User  login success and his data is : $data ");
        emit(RegisterSuccessState());
      
    }
   
    
  }
  
  void login({required String email, required String password})async{
    emit(LoginLoadingState());  
    try{
       Response response = await http.post(
      Uri.parse('https://a424-154-184-240-112.ngrok-free.app/api/login/'),
      headers: {
          'lang': 'ar',
        },
      body: {
        
        'email_or_phone' : email,
        'password': password
        }
    );
     var data = jsonDecode(response.body);
    if(response.statusCode == 200){
     
      
        debugPrint("User  login success and his data is : $data ");
        emit(LoginSuccessState());
      
    
    }

      else {
         debugPrint("failed to login , reason is : ${data['message']} ");
        emit(FaildToLoginState(message: data['message']));
      }

    }
    catch (e){
      emit(FaildToLoginState(message: e.toString()));
    }
    
  }
  }
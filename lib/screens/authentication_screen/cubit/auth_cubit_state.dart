abstract class AuthStates{}

class AuthInitialState extends AuthStates{} 

class RegisterLoadingState extends AuthStates{} 
class RegisterSuccessState extends AuthStates{} 
class FaildToRegisterState extends AuthStates{
  final String message;
  FaildToRegisterState({required this.message});

} 

class LoginLoadingState extends AuthStates{} 
class LoginSuccessState extends AuthStates{} 
class FaildToLoginState extends AuthStates{
   final String message;
  FaildToLoginState({required this.message});
}
import 'package:flutter/material.dart';
import 'package:flutter_node_auth/Common/Widgets/Custom_Button.dart';
import 'package:flutter_node_auth/Common/Widgets/Customtextfield.dart';
import 'package:flutter_node_auth/Service/AuthService.dart';

class Signupnew extends StatefulWidget {
  const Signupnew({super.key});

  @override
  State<Signupnew> createState() => _SignupnewState();
}

class _SignupnewState extends State<Signupnew> {

  final _SignupFormKey=GlobalKey<FormState>();
  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  AuthSevice authSevice=AuthSevice();

  @override
  void dispose() {
    super.dispose();
   namecontroller.dispose();
   emailcontroller.dispose();
   passwordcontroller.dispose();
  }

void SignupUsers(){
  authSevice.Signup(context: context, email: emailcontroller.text,
  name: namecontroller.text,
  password: passwordcontroller.text);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
              Text("Sign Up"),
             Center(
               child: Container(
                width: 500,
                 child: Form(
                  key: _SignupFormKey,
                           child: Column(
                  children: [
                     Customtextfield(
                           hint: "Name",
                           labelText: "Name",
                           controller: namecontroller,

                    ),
                    SizedBox(height: 10,),
                     Customtextfield(
                           hint: "Email",
                           labelText: "Email",
                           controller: emailcontroller,

                    ),
                    const SizedBox(height: 10,),
                     Customtextfield(
                           hint: "Password",
                           labelText: "password",
                           controller: passwordcontroller,

                    ),
                    SizedBox(height: 20,),
                    CustomButton(text: "Sign Up",
                     onTap: (){
                       if(_SignupFormKey.currentState!.validate())

                     {

SignupUsers();
                     }
                     },


                    )


                  ],
                           )),
               ),
             )
          ],
        ),
      ),
    );
  }
}
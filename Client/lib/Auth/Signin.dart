import 'package:flutter/material.dart';
import 'package:flutter_node_auth/Common/Widgets/Custom_Button.dart';
import 'package:flutter_node_auth/Common/Widgets/Customtextfield.dart';
import 'package:flutter_node_auth/Service/AuthService.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _loignformkey=GlobalKey<FormState>();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  @override
  void dispose() {
    super.dispose();
   emailcontroller.dispose();
   passwordcontroller.dispose();
  }
  AuthSevice siginservice=AuthSevice();
  void Signuser(){
    siginservice.Signin(context: context,
    email: emailcontroller.text,
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

            Text("Sign In"),
             Center(

               child: Container(
                width: 500,

                 child: Form(
                  key: _loignformkey,
                           child: Column(
                  children: [

                     Customtextfield(
                           hint: "Email",
                           labelText: "Email",
                           controller: emailcontroller,

                    ),
                    SizedBox(height: 10,),
                     Customtextfield(
                           hint: "Password",
                           labelText: "password",
                           controller: passwordcontroller,

                    ),
                    SizedBox(height: 20,),
                    CustomButton(text: "Sign In",
                     onTap: (){
                       if(_loignformkey.currentState!.validate())

                     {
                           Signuser();

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
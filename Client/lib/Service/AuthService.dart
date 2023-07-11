// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_node_auth/Constants/Errorhandling.dart';
import 'package:flutter_node_auth/Constants/Globalvariable.dart';
import 'package:flutter_node_auth/Constants/utilis.dart';
import 'package:flutter_node_auth/Models/User.dart';
import 'package:flutter_node_auth/Provider/User_provider.dart';
import 'package:flutter_node_auth/Screens/Home.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthSevice{
void Signup({
  required BuildContext context,
  required String email,
  required String name,
  required String password,
})async{
try {
User user=User(
  id: "",
  name: name,
  email: email,
  password: password,
   address: "",
   type: "",
   token: "");
http.Response res= await http.post(Uri.parse("$uri/api/signup"),
body: user.toJson(),
headers: <String,String>{
  'Content-Type':'application/json; charset=UTF-8'
}
);
httErrorHandle(response: res,
context: context,
onSucess:(){}

);
} catch (e) {
showSnackBar(context, e.toString());
}
}

void Signin({
  required BuildContext context,
  required String email,
  required String password,
})async{
try {
http.Response res= await http.post(Uri.parse("$uri/api/signin"),
body: jsonEncode({'email':email,'password':password}),

headers: <String,String>{
  'Content-Type':'application/json; charset=UTF-8'
}
);
print(res.body);


   httErrorHandle(response: res,
context: context,
onSucess:() async{
SharedPreferences prefs = await SharedPreferences.getInstance();
Provider.of<Userprovider>(context, listen:false).setUser(res.body);

 await prefs.setString('X-auth-token', jsonDecode(res.body)['token']);
Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));

}

);
print(res.body);
} catch (e) {
showSnackBar(context, e.toString());
}
}
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_node_auth/Constants/utilis.dart';
import 'package:http/http.dart'as http;
void httErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSucess,

}){
  switch(response.statusCode){
    case 200:
    onSucess();

    break;
    case 400:
    showSnackBar(context, jsonDecode(response.body)['msg']);
 break;
 case 500:
    showSnackBar(context, jsonDecode(response.body)['error']);
break;
default:
    showSnackBar(context, response.body);


  }
}
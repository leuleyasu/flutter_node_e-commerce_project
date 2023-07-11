
import 'package:flutter/material.dart';
import 'package:flutter_node_auth/Provider/User_provider.dart';
import 'package:provider/provider.dart';

import 'Auth/Signin.dart';

void main() {
  runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context)=>Userprovider(),),

  ],

  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ecommerse project Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      ),
      // routes: {
      //    '/':(context)=>const Signin(),
      //   '/Signup':(context)=>const Signupnew(),
      //   'HomeScreen':(context)=>const HomeScreen(),

      //  },
      home: const Signin(),

    );
  }
}

import 'package:flutter/material.dart';

import '../Models/User.dart';

class Userprovider extends ChangeNotifier {
User _user=User(id: '', name: '', email: '', password: '', address: '', type: '', token: '');

  User get user =>_user;
  void setUser(String user){
    _user=User .fromJson(user);
    notifyListeners();
  }
}
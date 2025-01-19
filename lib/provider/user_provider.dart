import 'package:flutter/material.dart';

import '../fire_base/model/myUser.dart';

class UserProvider extends ChangeNotifier {
  MyUser? currentUser;

  void updateUser(MyUser newUser){
    currentUser = newUser;
    notifyListeners();
  }
}
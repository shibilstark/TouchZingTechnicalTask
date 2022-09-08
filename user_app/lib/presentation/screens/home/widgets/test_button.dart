// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:user_app/application/service/user.dart';

class TestButton extends StatelessWidget {
  const TestButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
      icon: Icon(Icons.search),
      onPressed: () async {
        final UserServices userServices = UserServices();
        await userServices.getUsers();
      },
    ));
  }
}

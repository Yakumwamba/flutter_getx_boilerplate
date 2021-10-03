import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/modules/auth/auth.dart';
import 'package:flutter_getx_boilerplate/routes/routes.dart';
import 'package:flutter_getx_boilerplate/shared/shared.dart';
import 'package:get/get.dart';

class AuthScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: _buildItems(context),
        ),
      ),
    );
  }

  Widget _buildItems(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      children: [
        Container(
            width: Get.width,
            height: 200,
            child: Image.asset("assets/images/logo.png")),
        SizedBox(height: 20.0),
        Text(
          'Learner Support Material',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CommonConstants.largeText,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.headline4!.color,
          ),
        ),
        SizedBox(height: 50.0),
        SizedBox(height: 20.0),
        BorderButton(
          text: 'Get Started',
          onPressed: () {
            Get.toNamed(Routes.HOME);
          },
        ),
        SizedBox(height: 62.0),
        Text(
          '',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: CommonConstants.smallText,
            color: ColorConstants.tipColor,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/core/assets.dart';
import 'package:user_app/core/color.dart';
import 'package:user_app/core/const.dart';
import 'package:user_app/core/styles.dart';
import 'package:user_app/domain/models/user_model.dart';
import 'package:user_app/presentation/widgets/gap.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          titleSpacing: -5,
          title: Text(
            "Profile",
            style: getHomeTileTitleStyle().copyWith(
                fontWeight: FontWeight.bold, color: pureWhite, fontSize: 19),
          )),
      body: UserScreenBody(user: user),
    );
  }
}

class UserScreenBody extends StatelessWidget {
  const UserScreenBody({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kCommonScreenPadding,
      child: SingleChildScrollView(
        child: Align(
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: primaryColor,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: SvgPicture.asset(MyAssetImages.avatar),
                ),
              ),
              const Gap(H: 40),
              Row(
                children: [
                  KeyValueTile(title: "Name", value: user.name),
                ],
              ),
              const Gap(H: 10),
              Row(
                children: [
                  KeyValueTile(title: "Age", value: user.age.toString()),
                  const Gap(W: 10),
                  KeyValueTile(title: "Salary", value: user.salary.toString()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class KeyValueTile extends StatelessWidget {
  const KeyValueTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 15, color: pureBlack, fontWeight: FontWeight.bold),
            ),
            // Gap(H: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Align(
                  child: Text(
                value,
                style: const TextStyle(color: pureBlack, fontSize: 19),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

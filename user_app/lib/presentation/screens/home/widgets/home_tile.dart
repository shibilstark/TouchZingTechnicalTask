import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/core/assets.dart';
import 'package:user_app/core/color.dart';
import 'package:user_app/core/const.dart';
import 'package:user_app/core/styles.dart';
import 'package:user_app/domain/models/user_model.dart';
import 'package:user_app/presentation/routes/route.dart';

class UserHomeTile extends StatelessWidget {
  const UserHomeTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, RouteNames.USER_SCREEN,
          arguments: ScreenArgs({'user': user})),
      dense: true,
      contentPadding: kCommonScreenPadding,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      tileColor: primaryColor.withOpacity(0.05),
      leading: CircleAvatar(
        radius: 20.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: SvgPicture.asset(MyAssetImages.avatar),
        ),
      ),
      title: Text(
        user.name,
        style: getHomeTileTitleStyle(),
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/application/logic/user/user_cubit.dart';
import 'package:user_app/core/assets.dart';
import 'package:user_app/core/color.dart';
import 'package:user_app/core/const.dart';
import 'package:user_app/presentation/routes/route.dart';
import 'package:user_app/presentation/widgets/gap.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 2));
      context.read<UserCubit>().getAllUsers();
      Navigator.pushReplacementNamed(context, RouteNames.HOME_SCREEN);
    });
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: primaryColor.withOpacity(0.2),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: kCommonScreenPadding,
                    height: size.height / 2,
                    child: SvgPicture.asset(MyAssetImages.splashBg)),
                const Gap(H: 20),
                const CircularProgressIndicator(
                  color: primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

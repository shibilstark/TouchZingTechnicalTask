import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/application/logic/user/user_cubit.dart';
import 'package:user_app/core/color.dart';
import 'package:user_app/core/const.dart';
import 'package:user_app/core/styles.dart';
import 'package:user_app/presentation/widgets/gap.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Error",
            style: getHomeTileTitleStyle().copyWith(
                fontSize: 18, color: pureBlack, fontWeight: FontWeight.w500),
          ),
          const Gap(H: 20),
          TextButton.icon(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(primaryColor.withOpacity(0.1)),
                padding: MaterialStateProperty.all(kCommonScreenPadding),
                foregroundColor: MaterialStateProperty.all(primaryColor),
              ),
              onPressed: () => context.read<UserCubit>().getAllUsers(),
              icon: const Icon(
                Icons.replay,
                size: 15,
              ),
              label: const Text("Retry"))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_app/application/logic/user/user_cubit.dart';
import 'package:user_app/core/const.dart';
import 'package:user_app/core/styles.dart';
import 'package:user_app/domain/failures/main_failures.dart';
import 'package:user_app/presentation/screens/home/widgets/error_widget.dart';
import 'package:user_app/presentation/screens/home/widgets/home_tile.dart';
import 'package:user_app/presentation/widgets/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "USER APP",
          style: getAppBarTitleStyle(),
        ),
        actions: [
          IconButton(
              onPressed: () => context.read<UserCubit>().getAllUsers(),
              icon: const Icon(Icons.replay))
        ],
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kCommonScreenPadding,
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, userState) {
          if (userState is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (userState is UserSuccess) {
            return ListView.separated(
                itemBuilder: (context, index) =>
                    UserHomeTile(user: userState.users[index]),
                separatorBuilder: (context, index) => const Gap(H: 10),
                itemCount: userState.users.length);
          } else {
            final error = userState as UserError;

            return BlocListener<UserCubit, UserState>(
              listener: (context, state) {
                if (error.failures.type == FailureType.client) {
                  Fluttertoast.showToast(
                      msg: 'Check Your Network Connection And Try Again');
                }
                if (error.failures.type == FailureType.server) {
                  Fluttertoast.showToast(msg: 'Something Went Wrong Try Again');
                }
              },
              child: const HomeErrorWidget(),
            );
          }
        },
      ),
    );
  }
}

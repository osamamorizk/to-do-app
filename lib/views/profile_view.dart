import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:todo/consts.dart';
import 'package:todo/cubits/auth_cubit/auth_cubit.dart';
import 'package:todo/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo/views/login_view.dart';

import 'package:todo/widgets/profile_body.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  static String id = 'kk';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<TasksCubit, TasksState>(
      listener: (context, state) {
        if (state is NoUserSigned) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginView()),
              (Route<dynamic> route) => false);
        }
      },
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLogOutSuccess) {
              Fluttertoast.showToast(
                  msg: state.successMessage,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginView()),
                  (Route<dynamic> route) => false);
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 240, 237, 237),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      onPressed: () async {
                        await QuickAlert.show(
                          headerBackgroundColor: kColorBackground,
                          backgroundColor: kColorBackground,
                          context: context,
                          titleColor: kColorHints,
                          type: QuickAlertType.warning,
                          textColor: kColorHints,
                          showCancelBtn: true,
                          text: 'Do you want to logout',
                          confirmBtnText: 'Yes',
                          onCancelBtnTap: () => Navigator.pop(context),
                          cancelBtnText: 'No',
                          onConfirmBtnTap: () async {
                            BlocProvider.of<AuthCubit>(context).logOut();
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => LoginView()),
                                (Route<dynamic> route) => false);
                          },
                          confirmBtnColor: kColor,
                        );
                      },
                      icon: Icon(Icons.logout),
                    ),
                  )
                ],
                leading: const Icon(
                  Icons.account_circle,
                  color: kColor,
                ),
                scrolledUnderElevation: 0,
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    color: kColorHints,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              body: ProfileBody(),
            );
          },
        ),
      ),
    );
  }
}

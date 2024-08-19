import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/cubits/auth_cubit/auth_cubit.dart';
import 'package:todo/consts.dart';
import 'package:todo/views/home_view.dart';
import 'package:todo/views/register_view.dart';
import 'package:todo/widgets/custom_button.dart';
import 'package:todo/widgets/custom_text_field.dart';
import 'package:todo/widgets/qusetion_inauth.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'loginPage';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: kColorBackground,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 90,
                ),
                const Image(
                  height: 150,
                  width: 200,
                  image: AssetImage('assets/images/7.png'),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sign in',
                      style: TextStyle(
                        color: kColorHints,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.blueGrey,
                  ),
                  obscureText: false,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  hint: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.key,
                    color: Colors.blueGrey,
                  ),
                  obscureText: obscureText,
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscureText = !obscureText;
                      setState(() {});
                    },
                    icon: Icon(
                        color: Colors.blueGrey,
                        obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                  controller: passController,
                  keyboardType: TextInputType.visiblePassword,
                  hint: 'Password',
                ),
                const SizedBox(
                  height: 32,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoginSuccess) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomeView()),
                        (Route<dynamic> route) => false,
                      );
                    }
                    if (state is AuthFailure) {
                      Fluttertoast.showToast(
                          msg: state.errorMessage,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    if (state is AuthLoginSuccess) {
                      Fluttertoast.showToast(
                          msg: state.successMessage,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  builder: (context, state) {
                    return ConditionalBuilder(
                      condition: state is! AuthLoading,
                      builder: (context) => CustomButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            await BlocProvider.of<AuthCubit>(context).userLogin(
                                email: emailController.text,
                                password: passController.text);
                          }
                        },
                        text: 'Sign in',
                      ),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                QuestionWidget(
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterView.id);
                  },
                  action: 'Register',
                  question: 'Dont have an account?',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

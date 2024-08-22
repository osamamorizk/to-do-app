import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/cubits/auth_cubit/auth_cubit.dart';
import 'package:todo/consts.dart';
import 'package:todo/views/login_view.dart';
import 'package:todo/widgets/custom_bottom_nav_barr.dart';
import 'package:todo/widgets/custom_button.dart';
import 'package:todo/widgets/custom_text_field.dart';
import 'package:todo/widgets/qusetion_inauth.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 260,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
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
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                      ),
                      controller: passController,
                      keyboardType: TextInputType.visiblePassword,
                      hint: 'Password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        if (value != passController.text) return 'Not Match';

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
                            obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                      ),
                      controller: confirmPassController,
                      keyboardType: TextInputType.visiblePassword,
                      hint: 'Confirm Password',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
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
                        if (state is AuthRegisterSuccess) {
                          Fluttertoast.showToast(
                              msg: state.successMessage,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.pushNamed(
                              context, CustomBottomNavigationBar.id);
                        }
                      },
                      builder: (context, state) {
                        return ConditionalBuilder(
                          condition: state is! AuthLoading,
                          builder: (context) => CustomButton(
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                await BlocProvider.of<AuthCubit>(context)
                                    .userRegister(
                                        email: emailController.text,
                                        password: passController.text);
                              }
                            },
                            text: 'Register',
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
                        Navigator.pop(context);
                      },
                      action: 'Login',
                      question: 'Have an account?',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

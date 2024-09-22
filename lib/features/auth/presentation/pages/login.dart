// Date : Sept 21, 2024
// Authro : RLP
// Purpose : Login Page for user

// Date : Sept 22, 2024 1:18PM
// Author : RLP
// Purpose : Fix the TextFormField ( Email and Password )
//            Updated LabelText that wil not overlap on the border both focus and Loss focus

import 'package:flutter/material.dart';
import 'package:inventi/config/app_colors.dart';
import 'package:inventi/config/app_images.dart';
import 'package:inventi/config/app_sizes.dart';
import 'package:inventi/config/validator.dart';
import 'package:inventi/features/home/presentation/pages/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool isVisible = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.backgroundimage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Main content with scrollable form
          SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Center(
              child: Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.padding_25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppSizes.sizeBoxheight_100,
                      AppSizes.sizeBoxheight_50,
                      const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: AppSizes.fonstsizeMd,
                          color: AppColors.primaryWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AppSizes.sizeBoxheight_20,
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter Email Address',
                            floatingLabelBehavior: FloatingLabelBehavior
                                .auto, // Label floats when focused
                            labelStyle: const TextStyle(
                              color: AppColors.textStyleColor,
                              fontSize: AppSizes.fonstsizeMd,
                            ),
                            contentPadding: const EdgeInsets.only(
                              top:
                                  20.0, // Adjust top padding for space between label and text
                              bottom:
                                  10.0, // Space between text and error message
                              left: 12.0,
                              right: 12.0,
                            ),
                            // Border styles for focused and enabled states
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryWhite, width: 2.0),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.secondaryGrey, width: 1.5),
                            ),
                            // Handle error state
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryError, width: 1.5),
                            ),
                            focusedErrorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.primaryError, width: 2.0),
                            ),
                            filled: true,
                            fillColor: AppColors.primaryWhite,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _emailController.clear();
                              },
                              child: const Icon(Icons.close),
                            ),
                            errorStyle: const TextStyle(
                              color: AppColors
                                  .primaryError, // Customize error message color
                              fontSize:
                                  12.0, // Customize error message font size
                            ),
                          ),
                          controller: _emailController,
                          validator: (value) =>
                              // // Your validation logic here, e.g.:
                              // if (value == null || value.isEmpty) {
                              //   return 'Please enter your email address'; // Error message
                              // }
                              // return null; // No error
                              Validator.validateEmail(email: value!)),
                      AppSizes.sizeBoxheight_20,
                      TextFormField(
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          labelText: 'Enter Password',
                          floatingLabelBehavior: FloatingLabelBehavior
                              .auto, // Label floats when focused
                          labelStyle: const TextStyle(
                            color: AppColors.textStyleColor,
                            fontSize: AppSizes.fonstsizeMd,
                          ),
                          contentPadding: const EdgeInsets.only(
                            top:
                                20.0, // Adjust top padding for space between label and text
                            bottom:
                                10.0, // Space between text and error message
                            left: 12.0,
                            right: 12.0,
                          ),
                          // Border styles for focused and enabled states
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryWhite, width: 2.0),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.secondaryGrey, width: 1.5),
                          ),
                          // Handle error state
                          errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryError, width: 1.5),
                          ),
                          focusedErrorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryError, width: 2.0),
                          ),
                          filled: true,
                          fillColor: AppColors.primaryWhite,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            child: Icon(
                              isVisible
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                            ),
                          ),
                        ),
                        controller: _passwordController,
                        validator: (value) =>
                            Validator.validatePassword(password: value!),
                      ),
                      AppSizes.sizeBoxheight_20,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password ?',
                            style: TextStyle(
                              fontSize: AppSizes.fonstsizeMd,
                              color: AppColors.primaryWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      AppSizes.sizeBoxheight_30,
                      ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Text('Login'),
                      ),
                      AppSizes.sizeBoxheight_30,
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Don\'t have an account ?',
                              style: TextStyle(
                                fontSize: AppSizes.fonstsizeMd,
                                color: AppColors.primaryWhite,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              child: const Text(
                                'Sign up here',
                                style: TextStyle(
                                  fontSize: AppSizes.fonstsizeMd,
                                  color: AppColors.primaryWhite,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppSizes.sizeBoxheight_30,
                      Container(
                        height: AppSizes.poweredbyheight,
                        width: AppSizes.poweredbywidth,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.poweredby),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

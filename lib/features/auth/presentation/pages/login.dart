// Date : Sept 21, 2024
// Authro : RLP
// Purpose : Login Page for user

// Date : Sept 22, 2024 1:18PM
// Author : RLP
// Purpose : Fix the TextFormField ( Email and Password )
//            Updated LabelText that wil not overlap on the border both focus and Loss focus

// Date : Sept 22, 2024 2.41pm
// Author : RLP
// Purpose : Remove the backgrounfcolor in scaffold , add FutureBuilder for the image to display the
//            background image including other wdgets at the same. Unlike previous code there is a gray
//            background while the other widgets are already loaded.
//

import 'package:flutter/cupertino.dart';
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

  late Future<void> loadImage;
  String? emailError;
  String? passwordError;
  String emailLabelText = 'Email Address'; // Variable for label text
  String passwordLabelText = 'Enter Password'; // Variable for label text

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Precache the image using the fully initialized context
    loadImage =
        precacheImage(const AssetImage(AppImages.backgroundimage), context);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void validateEmail() {
    String? validationResult =
        Validator.validateEmail(email: _emailController.text);
    setState(() {
      emailError = validationResult; // Update the error state
      emailLabelText = validationResult ?? 'Email Address'; // Update label text
    });
  }

  void validatePassword() {
    String? validationResult =
        Validator.validatePassword(password: _passwordController.text);
    setState(() {
      passwordError = validationResult; // Update the error state
      passwordLabelText =
          validationResult ?? 'Enter Password'; // Update label text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: loadImage,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the image is loading, show a loading indicator or a placeholder
              return const Center(child: CupertinoActivityIndicator());
            } else {
              return Stack(
                children: [
                  // Background image
                  Image.asset(
                    AppImages.backgroundimage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),

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
                                  labelText: emailLabelText,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  labelStyle: TextStyle(
                                    color: emailError == null
                                        ? AppColors.textStyleColor
                                        : AppColors.primaryError,
                                    fontSize: AppSizes.fonstsizeMd,
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                    top: 20.0,
                                    bottom: 10.0,
                                    left: 12.0,
                                    right: 12.0,
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryWhite,
                                        width: 2.0),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.secondaryGrey,
                                        width: 1.5),
                                  ),
                                  filled: true,
                                  fillColor: AppColors.primaryWhite,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _emailController.clear();
                                      setState(() {
                                        emailError =
                                            null; // Clear the error on clear
                                        emailLabelText =
                                            'Email Address'; // Update label text
                                      });
                                    },
                                    child: const Icon(Icons.close),
                                  ),
                                ),
                                controller: _emailController,
                                onChanged: (value) {
                                  // Clear the error on text change
                                  setState(() {
                                    emailError = null;
                                    emailLabelText =
                                        'Email Address'; // Update label text
                                  });
                                },
                              ),
                              AppSizes.sizeBoxheight_20,
                              TextFormField(
                                obscureText: !isVisible,
                                decoration: InputDecoration(
                                  labelText: passwordLabelText,
                                  floatingLabelBehavior: FloatingLabelBehavior
                                      .auto, // Label floats when focused
                                  labelStyle: TextStyle(
                                    color: passwordError == null
                                        ? AppColors.textStyleColor
                                        : AppColors.primaryError,
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
                                        color: AppColors.primaryWhite,
                                        width: 2.0),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.secondaryGrey,
                                        width: 1.5),
                                  ),
                                  // Handle error state
                                  errorBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryError,
                                        width: 1.5),
                                  ),
                                  focusedErrorBorder:
                                      const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryError,
                                        width: 2.0),
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
                                onChanged: (value) {
                                  // Clear the error on text change
                                  setState(() {
                                    passwordError = null;
                                  });
                                },
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
                                  validateEmail(); // Validate email on button press
                                  validatePassword(); // Validate password on button press
                                  if (_formkey.currentState!.validate() &&
                                      emailError == null &&
                                      passwordError == null) {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
              );
            }
          }),
    );
  }
}

// Date : Sept 21, 2024
// Authro : RLP
// Purpose : Login Page for user
import 'package:flutter/material.dart';
import 'package:inventi/config/app_colors.dart';
import 'package:inventi/config/app_images.dart';
import 'package:inventi/config/app_sizes.dart';
import 'package:inventi/config/validator.dart';
import 'package:inventi/features/home/presentation/pages/homepage.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   final _formkey = GlobalKey<FormState>();

//   bool isVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     // final size = MediaQuery.of(context).size;
//     // final screenheight = size.height;
//     // final screenwidth = size.width;

//     return Scaffold(
//       // backgroundColor:
//       //     Colors.white, // Set a background color to prevent the black flash
//       body: Center(
//         child: SingleChildScrollView(
//           padding:
//               EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//           child: Form(
//             key: _formkey,
//             child: Stack(children: [
//               Container(
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(
//                         AppImages.backgroundimage), // Your background image
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Container(
//                 color: Colors.black
//                     .withOpacity(0.5), // Adjust the opacity as needed
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(AppSizes.padding_25),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // the purpose of the sizeBoxheight_40 to mimic the Signin Text display with cloud
//                     // identical to figma. somewhat close to the design,
//                     // but this can removed also
//                     AppSizes.sizeBoxheight_40,
//                     const Text(
//                       'Sign in',
//                       style: TextStyle(
//                         fontSize: AppSizes.fonstsizeMd,
//                         color: AppColors.primaryWhite,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     AppSizes.sizeBoxheight_20,
//                     TextFormField(
//                       decoration: InputDecoration(
//                         hintText:
//                             'Enter Email Address', // Hint text to show in the top-left corner
//                         floatingLabelBehavior: FloatingLabelBehavior
//                             .auto, // Makes the label float when typing
//                         hintStyle: const TextStyle(
//                           color: AppColors.textStyleColor,
//                           fontSize: AppSizes.fonstsizeMd,
//                         ),
//                         contentPadding: const EdgeInsets.all(AppSizes
//                             .padding_15), // Padding for the text fieldAdjust the padding to move the hint text to the top-left corner
//                         border: OutlineInputBorder(
//                           borderRadius:
//                               BorderRadius.circular(AppSizes.borderradius),
//                         ),
//                         filled: true,
//                         fillColor: AppColors.primaryWhite,
//                         suffixIcon: GestureDetector(
//                             onTap: () {
//                               _emailController.text = '';
//                             },
//                             child: const Icon(Icons.close)),
//                       ),
//                       controller: _emailController,
//                       validator: (value) =>
//                           Validator.validateEmail(email: value!),
//                     ),
//                     AppSizes.sizeBoxheight_20,
//                     TextFormField(
//                       obscureText: !isVisible,
//                       decoration: InputDecoration(
//                         hintText:
//                             'Enter Password', // Hint text to show in the top-left corner
//                         floatingLabelBehavior: FloatingLabelBehavior
//                             .auto, // Makes the label float when typing
//                         hintStyle: const TextStyle(
//                           color: AppColors.textStyleColor,
//                           fontSize: AppSizes.fonstsizeMd,
//                         ),
//                         contentPadding: const EdgeInsets.all(AppSizes
//                             .padding_15), // Padding for the text fieldAdjust the padding to move the hint text to the top-left corner
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         filled: true,
//                         fillColor: AppColors.primaryWhite,
//                         suffixIcon: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isVisible = !isVisible;
//                             });
//                           },
//                           child: Icon(
//                             isVisible
//                                 ? Icons.visibility_off_rounded
//                                 : Icons.visibility_rounded,
//                           ),
//                         ),
//                       ),
//                       controller: _passwordController,
//                       validator: (value) =>
//                           Validator.validatePassword(password: value!),
//                     ),
//                     AppSizes.sizeBoxheight_20,
//                     const Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           'Forgot Password ?',
//                           style: TextStyle(
//                             fontSize: AppSizes.fonstsizeMd,
//                             color: AppColors.primaryWhite,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         )
//                       ],
//                     ),
//                     AppSizes.sizeBoxheight_30,
//                     ElevatedButton(
//                         onPressed: () {
//                           // Assuming the user is Authenticated
//                           // it will route to homePage
//                           // for Demo Task we will just call the homepage based on the Figma Specification

//                           try {
//                             if (_formkey.currentState!.validate()) {
//                               Navigator.of(context).pushReplacement(
//                                 MaterialPageRoute(
//                                   builder: (context) => const HomePage(),
//                                 ),
//                               );
//                             }
//                           } catch (err) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text('$err')),
//                             );
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius
//                                 .zero, // No border radius for square corners
//                           ),
//                         ),
//                         child: const Text('Login')),
//                     AppSizes.sizeBoxheight_30,
//                     Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           const Text(
//                             'Dont have an account ?',
//                             style: TextStyle(
//                               fontSize: AppSizes.fonstsizeMd,
//                               color: AppColors.primaryWhite,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           GestureDetector(
//                             child: const Text(
//                               'Sign up here',
//                               style: TextStyle(
//                                 fontSize: AppSizes.fonstsizeMd,
//                                 color: AppColors.primaryWhite,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     AppSizes.sizeBoxheight_30,
//                     Container(
//                       height: AppSizes.poweredbyheight,
//                       width: AppSizes.poweredbywidth,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(
//                               AppImages.poweredby), // Your background image
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelStyle: const TextStyle(
                            color: AppColors.textStyleColor,
                            fontSize: AppSizes.fonstsizeMd,
                            height: 1.5, // Adjust this for label positioning
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20.0, // Adjust for height (taller)
                            horizontal: 12.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppSizes.borderradius),
                          ),
                          filled: true,
                          fillColor: AppColors.primaryWhite,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _emailController.clear();
                            },
                            child: const Icon(Icons.close),
                          ),
                        ),
                        controller: _emailController,
                        validator: (value) =>
                            Validator.validateEmail(email: value!),
                      ),
                      AppSizes.sizeBoxheight_20,
                      TextFormField(
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          labelText: 'Enter Password',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelStyle: const TextStyle(
                            color: AppColors.textStyleColor,
                            fontSize: AppSizes.fonstsizeMd,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, // Adjust this for desired height
                            horizontal: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
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

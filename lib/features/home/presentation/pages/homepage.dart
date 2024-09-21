import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventi/config/app_colors.dart';
import 'package:inventi/config/app_sizes.dart';

import 'package:inventi/features/home/presentation/bloc/randomstring/random_string_bloc.dart';
import 'package:inventi/features/home/presentation/bloc/randomstring/random_string_event.dart';
import 'package:inventi/features/home/presentation/bloc/randomstring/random_string_state.dart';
import 'package:flutter/cupertino.dart';

import 'package:inventi/features/auth/presentation/pages/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController randomStringController =
        TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.pageColor,
      appBar: AppBar(
        backgroundColor: AppColors.pageColor,
        leadingWidth: 150,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: kToolbarHeight,
            width: 100,
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/defaults/menu.png',
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 25,
                  child: Image.asset(
                    'assets/defaults/poweredbyMenu.png',
                    height: 30,
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(16.0),
                child: BlocListener<RandomStringBloc, RandomStringState>(
                  listener: (context, state) {
                    if (state is RandomStringError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }

                    if (state is RandomStringLoaded) {
                      randomStringController.text = state.allRandomString.first
                          .randomString; // Assuming single item
                    }
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        enabled: false,
                        style: const TextStyle(
                          color: AppColors.fontColor,
                        ),
                        controller: randomStringController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: AppColors.pageColor,
                          border: InputBorder.none,
                          hintText: 'Quick Button',
                          hintStyle: TextStyle(
                            color: AppColors.fontColor,
                            fontSize: AppSizes.fonstsizeL,
                            fontWeight: FontWeight.bold,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      AppSizes.sizeBoxheight_10,
                      SizedBox(
                        height: 80,
                        child: BlocBuilder<RandomStringBloc, RandomStringState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: () {
                                try {
                                  context
                                      .read<RandomStringBloc>()
                                      .add(const FetchAllRandomString());
                                } catch (err) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('$err')),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                              ),
                              child: state is RandomStringLoading
                                  ? SizedBox(
                                      height: 40.0,
                                      width: 40.0,
                                      child: CupertinoTheme(
                                        data: const CupertinoThemeData(
                                          brightness: Brightness.dark,
                                        ),
                                        child: Transform.scale(
                                          scale:
                                              2.0, // Adjust this to scale the size
                                          child:
                                              const CupertinoActivityIndicator(),
                                        ),
                                      ),
                                    )
                                  : const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 5),
                                        Icon(
                                          Icons.build,
                                          size: 24.0,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Click the button to generate the new random string',
                                          style: TextStyle(
                                            fontSize: AppSizes.fonstsizeSm,
                                            color: AppColors.primaryWhite,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

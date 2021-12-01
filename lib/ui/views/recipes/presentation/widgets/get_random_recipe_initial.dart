import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class GetRandomRecipeInitial extends StatelessWidget {
  final VoidCallback onPressed;

  const GetRandomRecipeInitial({
    Key? key,
    required this.onPressed 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInDown(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Image.asset('assets/images/random.png')
          ),
        ),
        FadeInDown(
          child: MaterialButton(
            onPressed: onPressed,
            height: 35,
            color: Colors.black,
            child: const Text(
              'Get Random Recipe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 75
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
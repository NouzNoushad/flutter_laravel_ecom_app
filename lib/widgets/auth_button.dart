import 'package:ecom_app_bloc/utils/colors.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  const AuthButton({super.key, required this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.075,
      width: MediaQuery.of(context).size.width * 0.4,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ColorPicker.primaryColor2),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ))),
          child: Text(
            buttonText.toUpperCase(),
            style: const TextStyle(
              fontSize: 16,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              color: ColorPicker.whiteColor,
            ),
          )),
    );
  }
}

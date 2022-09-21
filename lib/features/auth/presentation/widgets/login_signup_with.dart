import 'package:flutter/material.dart';

class LoginOrSignupWith extends StatelessWidget {
  const LoginOrSignupWith({
    Key? key,
    required this.tittle,
    this.backgroundColor,
    required this.icon,
    this.onPressed,
  }) : super(key: key);
  final String tittle;
  final Color? backgroundColor;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        fixedSize: Size(MediaQuery.of(context).size.width / 2.5, 40),
        backgroundColor: backgroundColor,
        shadowColor: Colors.black,
        elevation: 10,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(tittle),
          ],
        ),
      ),
    );
  }
}

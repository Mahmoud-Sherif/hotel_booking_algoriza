import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profileItemsWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onpressed;
  final IconData icon;

  const profileItemsWidget({Key? key, required this.text, this.onpressed, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        //color: Colors.amberAccent,
        //ibr
        padding: const EdgeInsets.symmetric(horizontal: 35),
        height: 56,
        onPressed: onpressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$text",style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            ),
            Icon(icon,  color: Color(0xFF555555),size: 27,),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.text, this.onTap}) : super(key: key);
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$text",
          style: TextStyle(
            color: Color(0xFFd5d5d5),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        InkWell(
          child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.translate('view_all')!,
                    style: TextStyle(
                      color: Color(0xFF4fbe9e),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  Icon(Icons.arrow_forward_rounded, color:  Color(0xFF4fbe9e),)
                ],
              )
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
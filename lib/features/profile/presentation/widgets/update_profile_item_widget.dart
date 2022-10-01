import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/core/utils/media_query_values.dart';

class UpdateProfileItemWidget extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final String hintText;

  const UpdateProfileItemWidget(
      {Key? key,
      required this.text,
      required this.controller,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF5a5a5a),
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          // SizedBox(
          //   width: 100,
          // ),
          Container(
            width: 200,
            //MediaQuery.of(context).size.width*0.5,
            // alignment: Alignment.topRight,
            child: TextField(
              textDirection: TextDirection.rtl,
              controller: controller,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "$hintText",
                  hintStyle: TextStyle(
                    // color: Color(0xFF5a5a5a),
                    // fontWeight: FontWeight.w500,
                    // fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  hintTextDirection: TextDirection.rtl),
            ),
          )
        ],
      ),
    );
  }
}//
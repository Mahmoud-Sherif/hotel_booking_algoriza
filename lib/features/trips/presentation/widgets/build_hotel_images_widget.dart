import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

buildHorizontalHotelImagesList() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.0),
    height: 160,
    width: double.infinity,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      primary: false,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Container(
            height: 160.0,
            width: 125.0,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                    "https://www.swissotel.ae/assets/0/92/3686/3768/3770/6442451433/ae87da19-9f23-450a-8927-6f4c700aa104.jpg"),
                //AssetImage("asset/hotel2.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          onTap: () {},
        );
      },
    ),
  );
}
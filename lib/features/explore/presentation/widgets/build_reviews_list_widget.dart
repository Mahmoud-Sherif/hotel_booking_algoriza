import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../profile/presentation/widgets/divider_widget.dart';

buildHotelReviewList() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.0),
    height: 385,
    width: double.infinity,
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      primary: false,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 55.0,
                    height: 50.0,
                    margin: const EdgeInsets.only(
                      right: 15.0,
                    ),
                    decoration: new BoxDecoration(
                      border: Border.all(color: Colors.white),
                      //shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(8),
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://i.imgur.com/iQkzaTO.jpg"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Cristna fouad",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${AppLocalizations.of(context)!.translate('last_updated')!} November 1, 2020",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF878787),
                          ),
                        ),
                        Text(
                          "(8.0)",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                ),
                child: Column(
                  children: [
                    Text(
                      "this is located in a great spot close to shops and bars, very quiet location",
                      style: TextStyle(
                        color: Color(0xFF878787),
                      ),
                    ),
                    InkWell(
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.translate('reply')!,
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
                      onTap: () {


                      },
                    ),
                    dividerWidget(0, 0,0),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
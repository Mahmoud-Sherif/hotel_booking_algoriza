import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/features/profile/data/models/profile_model.dart';

import '../../../../config/locale/app_localizations.dart';
import '../pages/update_profile_screen.dart';

class UserProfileHeaderWidget extends StatelessWidget {
  final ProfileModel profileModel;
  const UserProfileHeaderWidget({Key? key, required this.profileModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UpdateProfileScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
        // height: 100,
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.white),
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  child: Text(
                    profileModel.user.name,
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    color: Color(0xFF727272),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!
                        .translate('view_and_edit_profile')!,
                  ),
                ),
              ],
            ),
            CircleAvatar(
              radius: 30.0,
              backgroundImage:
                  //Image.asset('asset/food2.png'),
                  NetworkImage(
                "${profileModel.user.image}",
              ),
              //"http://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"),
              backgroundColor: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

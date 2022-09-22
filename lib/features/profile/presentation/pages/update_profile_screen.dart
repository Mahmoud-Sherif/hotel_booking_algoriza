import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/divider_widget.dart';
import '../widgets/update_profile_item_widget.dart';

class UpdateProfileScreen extends StatelessWidget {
   UpdateProfileScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1a1a1a),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "http://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"),
                        ),
                        Positioned(
                            bottom: 0,
                            right: -25,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: Color(0xFF4fbe9e),
                              child: Icon(
                                Icons.camera_alt,
                                color: Color(0xFF2c2c2c),
                                size: 18,
                              ),
                              padding: EdgeInsets.all(5.0),
                              shape: CircleBorder(),
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                UpdateProfileItemWidget(text: "UserName", controller: nameController,hintText: "Amanda Jane"),
                dividerWidget(15, 15,1),
                UpdateProfileItemWidget(text:"Email", controller:emailController, hintText:"amanda@gmail.com"),
                dividerWidget(15, 15,1),
                UpdateProfileItemWidget(text:"Phone", controller:phoneController, hintText:"+95936575739"),
                dividerWidget(15, 15,1),
                UpdateProfileItemWidget(text:"Date of Birth", controller:dateOfBirthController, hintText:"20,sep 2020"),
                dividerWidget(15, 15,1),
                UpdateProfileItemWidget(text:"Address", controller:addressController,hintText:"egypt, cairo"),
                dividerWidget(15, 15,1),


              ],
            ),
          ),
        ),
      ),
    );
  }

}

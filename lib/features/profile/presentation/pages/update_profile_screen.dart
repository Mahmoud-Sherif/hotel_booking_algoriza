import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/features/home/presentation/pages/home_view.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/magic_router.dart';
import '../../../lang/presentation/cubit/locale_cubit.dart';
import '../cubit/profile_cubit.dart';
import '../widgets/divider_widget.dart';
import '../widgets/update_profile_item_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a1a),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: ((context, state) {
                if (state is ProfileDataLoaded) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              )),
                          IconButton(
                              onPressed: () async {
                                await BlocProvider.of<ProfileCubit>(context)
                                    .uploadFile(
                                  //ProfileParams(
                                  name: nameController.text,
                                  email: emailController.text,
                                  filePath:
                                      BlocProvider.of<ProfileCubit>(context)
                                          .image,
                                  //BlocProvider.of<ProfileCubit>(context).uploadImage(ImageSource.gallery),
                                  //),
                                )
                                    .then((value) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CupertinoAlertDialog(
                                          title: const Text(
                                              'Edit User Profile Data '),
                                          content:
                                              const Text('User Data Updated'),
                                          actions: <Widget>[
                                            TextButton(
                                                onPressed: () {
                                                  MagicRouter.navigateAndPopAll(
                                                      const HomeView());
                                                },
                                                child: const Text(
                                                  'Ok',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )),
                                          ],
                                        );
                                      });
                                });
                              },
                              icon: const Icon(
                                Icons.done_rounded,
                                color: Colors.white,
                                size: 30,
                              )),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          AppLocalizations.of(context)!
                              .translate('edit_profile')!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                                  "${state.profileModel.user.image}",
                                  // BlocProvider.of<ProfileCubit>(context).imageURL
                                  //"http://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg",
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: -25,
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      BlocProvider.of<ProfileCubit>(context)
                                          .getImage();
                                    },
                                    elevation: 2.0,
                                    fillColor: Color(0xFF4fbe9e),
                                    padding: EdgeInsets.all(5.0),
                                    shape: CircleBorder(),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: Color(0xFF2c2c2c),
                                      size: 18,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      UpdateProfileItemWidget(
                          text: AppLocalizations.of(context)!
                              .translate('user_name')!,
                          controller: nameController,
                          hintText: "${state.profileModel.user.name}"),
                      dividerWidget(15, 15, 1),
                      UpdateProfileItemWidget(
                          text:
                              AppLocalizations.of(context)!.translate('email')!,
                          controller: emailController,
                          hintText: "${state.profileModel.user.email}"),
                      dividerWidget(15, 15, 1),
                      UpdateProfileItemWidget(
                          text:
                              AppLocalizations.of(context)!.translate('phone')!,
                          controller: phoneController,
                          hintText: "+966 3436575739"),
                      dividerWidget(15, 15, 1),
                      UpdateProfileItemWidget(
                          text: AppLocalizations.of(context)!
                              .translate('date_of_birth')!,
                          controller: dateOfBirthController,
                          hintText: "20,Sep 1999"),
                      dividerWidget(15, 15, 1),
                      UpdateProfileItemWidget(
                          text: AppLocalizations.of(context)!
                              .translate('address')!,
                          controller: addressController,
                          hintText: "Egypt, Cairo"),
                      dividerWidget(15, 15, 1),
                      // Center(
                      //   child: ElevatedButton(
                      //     onPressed: () async {
                      //       await BlocProvider.of<ProfileCubit>(context)
                      //           .uploadFile(
                      //         //ProfileParams(
                      //         name: nameController.text,
                      //         email: emailController.text,
                      //         filePath:
                      //             BlocProvider.of<ProfileCubit>(context).image,
                      //         //BlocProvider.of<ProfileCubit>(context).uploadImage(ImageSource.gallery),
                      //         //),
                      //       );
                      //     },
                      //     child: Text("update"),
                      //   ),
                      // ),
                      // ElevatedButton(
                      //     onPressed: () async {
                      //       MagicRouter.navigateAndPopAll(const SplashPage());
                      //     },
                      //     child: const Text('SignOut'))
                    ],
                  );
                } else {
                  return Container();
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}

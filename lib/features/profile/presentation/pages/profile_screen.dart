import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:hotel_booking_algoriza/features/profile/presentation/pages/setting_screen.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/magic_router.dart';
import '../widgets/divider_widget.dart';
import '../widgets/profile_items_widget.dart';
import '../widgets/user_profile_header_widget.dart';

class ProrileScreen extends StatefulWidget {
  ProrileScreen({
    Key? key,
    /*required this.userModel*/
  }) : super(key: key);

  // UserModel userModel;
  //ApiConsumer apiConsumer;

  @override
  State<ProrileScreen> createState() => _ProrileScreenState();
}

class _ProrileScreenState extends State<ProrileScreen> {
  _getUserProfileData() =>
      BlocProvider.of<ProfileCubit>(context).getProfileData();

  @override
  void initState() {
    //testApi();
    super.initState();
    _getUserProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1a1a1a),
      body: SafeArea(
        child: Container(
          //color: Color(0xFF555555),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                  builder: ((context, state) {
                if (state is ProfileDataLoaded) {
                  return UserProfileHeaderWidget(
                    profileModel: state.profileModel,
                  );
                } else {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: Colors.grey,
                    ),
                  );
                  //return Container();
                }
              })),

              //SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  children: [
                    profileItemsWidget(
                      text:
                      AppLocalizations.of(context)!.translate('change_password')!,
                      icon: Icons.lock,
                      iconSize: 27,
                    ),
                    dividerWidget(15, 15, 0),
                    profileItemsWidget(
                      icon: Icons.people_rounded,
                      text: AppLocalizations.of(context)!
                          .translate('invite_friend')!,
                      iconSize: 27,
                    ),
                    dividerWidget(15, 15, 0),
                    profileItemsWidget(
                      icon: Icons.wallet_giftcard_rounded,
                      text: AppLocalizations.of(context)!
                          .translate('credit_coupons')!,
                      iconSize: 27,
                    ),
                    dividerWidget(15, 15, 0),
                    profileItemsWidget(
                      icon: Icons.error_outlined,
                      text:
                      AppLocalizations.of(context)!.translate('help_center')!,
                      iconSize: 27,
                    ),
                    dividerWidget(15, 15, 0),
                    profileItemsWidget(
                      icon: Icons.payment,
                      text: AppLocalizations.of(context)!.translate('payment')!,
                      iconSize: 27,
                      onpressed: (){},
                    ),
                    dividerWidget(15, 15, 0),
                    profileItemsWidget(
                      icon: Icons.settings,
                      onpressed: (){
                        MagicRouter.navigateTo(
                            const SettingScreen());
                      },
                      text: AppLocalizations.of(context)!.translate('setting')!, iconSize: 27,),
                    dividerWidget(15, 15, 0),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

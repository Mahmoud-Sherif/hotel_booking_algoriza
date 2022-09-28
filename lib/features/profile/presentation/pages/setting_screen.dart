import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../config/routes/magic_router.dart';
import '../../../intro/presentation/pages/splash_page.dart';
import '../../../lang/presentation/cubit/locale_cubit.dart';
import '../widgets/divider_widget.dart';
import '../widgets/profile_items_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Scaffold(
        backgroundColor: Color(0xFF1a1a1a),
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      AppLocalizations.of(context)!.translate('setting')!,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 15,),

                  //SizedBox(height: 15,),
                  profileItemsWidget(
                    text:
                    AppLocalizations.of(context)!.translate('notifications')!,
                    iconSize: 27,
                    icon: Icons.notifications_rounded,
                  ),
                  dividerWidget(15, 15, 0),
                  profileItemsWidget(
                    text:
                    AppLocalizations.of(context)!.translate('theme_mode')!,
                    icon: Icons.dark_mode_rounded,
                    iconSize: 27,
                  ),
                  dividerWidget(15, 15, 0),
                  profileItemsWidget(
                    text:
                    AppLocalizations.of(context)!.translate('language')!,
                    icon: Icons.translate_outlined,
                    iconSize: 27,
                    onpressed: (){
                      if (AppLocalizations.of(context)!.isEnLocale) {
                        BlocProvider.of<LocaleCubit>(context).toArabic();
                      } else {
                        BlocProvider.of<LocaleCubit>(context).toEnglish();
                      }
                    },
                  ),
                  dividerWidget(15, 15, 0),
                  profileItemsWidget(
                    text:
                    AppLocalizations.of(context)!.translate('country')!,
                    icon: Icons.language,
                    iconSize: 27,
                  ),
                  dividerWidget(15, 15, 0),
                  profileItemsWidget(
                      icon: Icons.currency_pound_rounded,
                      iconSize: 27,
                      text: AppLocalizations.of(context)!.translate('currency')!),
                  dividerWidget(15, 15, 0),
                  profileItemsWidget(
                      icon: Icons.color_lens_rounded,
                      iconSize: 27,
                      text: AppLocalizations.of(context)!.translate('color')!),
                  dividerWidget(15, 15, 0),
                  profileItemsWidget(
                    text:
                    AppLocalizations.of(context)!.translate('terms_of_services')!,
                    icon: Icons.arrow_forward_ios_rounded,
                    iconSize: 20,
                  ),
                  dividerWidget(15, 15, 0),
                  profileItemsWidget(
                      icon: Icons.arrow_forward_ios_rounded,
                      text: AppLocalizations.of(context)!
                          .translate('privacy_policy')!,
                    iconSize: 20,
                  ),
                  dividerWidget(15, 15, 0),
                  profileItemsWidget(
                      icon: Icons.arrow_forward_ios_rounded,
                      iconSize: 20,
                      text: AppLocalizations.of(context)!
                          .translate('give_us_feedbacks')!),
                  dividerWidget(15, 15, 0),
                  profileItemsWidget(
                      icon: Icons.arrow_forward_ios_rounded,
                      text:
                      AppLocalizations.of(context)!.translate('log_out')!,
                    iconSize: 20,
                      onpressed: () {
                        MagicRouter.navigateAndPopAll(const SplashPage());
                      },
                  ),
                  dividerWidget(15, 15, 0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

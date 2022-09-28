import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/const/enums.dart';
import '../cubit/navigation_cubit.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          items:  [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,
              ),
              label: AppLocalizations.of(context)!.translate('explore')!,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outline,
              ),
              label: AppLocalizations.of(context)!.translate('trips')!,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_rounded,
              ),
              label: AppLocalizations.of(context)!.translate('profile')!,
            ),
          ],
          onTap: (index) {
            final cubit = NavigationCubit.of(context);
            if (index == 0) {
              cubit.getNavBarItem(NavbarItem.explore);
            } else if (index == 1) {
              cubit.getNavBarItem(NavbarItem.trips);
            } else if (index == 2) {
              cubit.getNavBarItem(NavbarItem.profile);
            }
          },
        );
      },
    );
  }
}

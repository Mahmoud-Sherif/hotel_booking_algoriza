import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/features/explore/presentation/pages/explore_view.dart';
import '../../../../core/const/enums.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
import '../../../trips/presentation/pages/trips_page.dart';
import '../cubit/navigation_cubit.dart';
import '../widgets/bottom_navigation.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Scaffold(
        // drawer: const AppDrawer(),
        bottomNavigationBar: const BottomNav(),
        body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            if (state.navbarItem == NavbarItem.explore) {
              return ExploreView();
            } else if (state.navbarItem == NavbarItem.trips) {
              return const TripsPage();
            } else if (state.navbarItem == NavbarItem.profile) {
              return ProrileScreen();
            }
            return Container();
          },
        ),
      ),
    );
  }
}

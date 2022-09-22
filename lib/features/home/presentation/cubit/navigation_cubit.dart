import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/const/enums.dart';
part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.explore, 0));
  static NavigationCubit of(context) => BlocProvider.of(context);
  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.explore:
        emit(const NavigationState(NavbarItem.explore, 0));
        break;
      case NavbarItem.trips:
        emit(const NavigationState(NavbarItem.trips, 1));
        break;
      case NavbarItem.profile:
        emit(const NavigationState(NavbarItem.profile, 2));
        break;
    }
  }
}

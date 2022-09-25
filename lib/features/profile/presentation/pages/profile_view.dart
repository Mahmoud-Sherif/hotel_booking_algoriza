import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/config/routes/magic_router.dart';
import 'package:hotel_booking_algoriza/features/auth/data/datasources/local/autl_local_data_source.dart';
import 'package:hotel_booking_algoriza/features/auth/presentation/pages/login.dart';
import 'package:hotel_booking_algoriza/features/intro/presentation/pages/splash_page.dart';

import '../../../../injection_container.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Text('Profile view'),
          ),
          ElevatedButton(
              onPressed: () async {
                MagicRouter.navigateAndPopAll(const SplashPage());
              },
              child: const Text('SignOut'))
        ],
      ),
    );
  }
}

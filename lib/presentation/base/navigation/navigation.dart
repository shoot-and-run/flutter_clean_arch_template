import 'package:beamer/beamer.dart';
import 'package:clean_arch_template/data/data_storage/app_preference.dart';
import 'package:clean_arch_template/di/di_host.dart';
import 'package:clean_arch_template/presentation/base/cubit/host_cubit.dart';
import 'package:clean_arch_template/presentation/features/auth/auth_cubit.dart';
import 'package:clean_arch_template/presentation/features/auth/auth_screen.dart';
import 'package:flutter/material.dart';

final routerDelegate = BeamerDelegate(
  guards: [
    BeamGuard(
      pathPatterns: <String>[AuthScreen.screenName],
      guardNonMatching: true,
      check: (context, location) =>
          DIHost.of(context)
              .get<AppPreferences>()
              .getString(PreferenceConstants.authToken) !=
          null,
      beamToNamed: (origin, target) => AuthScreen.screenName,
    )
  ],
  locationBuilder: RoutesLocationBuilder(
    routes: <String, Widget Function(BuildContext, BeamState, Object?)>{
      AuthScreen.screenName: (c, s, o) => const HostCubit<AuthCubit>(
            child: AuthScreen(),
          ),
    },
  ),
);

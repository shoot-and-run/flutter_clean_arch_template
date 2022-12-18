import 'package:clean_arch_template/di/di_host.dart';
import 'package:clean_arch_template/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HostCubit<T extends BlocBase> extends StatelessWidget {
  const HostCubit({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (_) {
        final logger = getLogger('HostCubit');

        final getIt = DIHost.of(context);

        if (!getIt.isRegistered<T>()) {
          logger.e('Type $T is not marked as injectable');
          throw Exception('Type $T is not marked as injectable');
        }

        final cubit = getIt.get<T>();

        return cubit;
      },
      child: child,
    );
  }
}

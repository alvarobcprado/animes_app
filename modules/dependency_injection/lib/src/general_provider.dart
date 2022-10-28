import 'package:core/dependencies/dependency_injection.dart';
import 'package:dependency_injection/src/common/common_providers.dart';
import 'package:dependency_injection/src/modules/data_local/data_local_providers.dart';
import 'package:dependency_injection/src/modules/feature_home/feature_home_providers.dart';
import 'package:flutter/material.dart';

class GeneralProvider extends StatelessWidget {
  const GeneralProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...commonProviders(),
        ...dataLocalProviders(),
        ...featureHomeProviders(),
      ],
      builder: (context, child) => child!,
      child: child,
    );
  }
}

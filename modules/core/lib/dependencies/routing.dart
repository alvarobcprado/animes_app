library routing;

export 'package:go_router/go_router.dart';

/// A class to centralize all route names in core module to avoid duplication
/// and allow navigation between modules.
/// Example: An auth module can navigate to home module by using
///
/// `GoRouter.of(context).goNamed(RouteNames.home)`
class RouteNames {
  static const String home = 'Home';
  static const String details = 'Details';
  static const String favorite = 'Favorite';
}

import '../../303/lottie_learn.dart';
import '../../303/navigator/navigate_home_detail_view.dart';
import '../../303/navigator/navigate_home_view.dart';

class NavigatorRoutes {
  final items = {
    "/": (context) => const LottieLenar(),
    NavigateRoutes.home.withParaf: (context) => const NavigateHomeView(),
    NavigateRoutes.detail.withParaf: (context) => const NavigateHomeDetailView()
  };
}

enum NavigateRoutes { init, home, detail }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParaf => "/$name";
}

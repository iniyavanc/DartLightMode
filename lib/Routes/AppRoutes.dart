enum AppRoutes { root, login, productDetailScreen }

extension AppRouteExtension on AppRoutes {
  static const appRoutes = {
    AppRoutes.root: "/",
    AppRoutes.login: "/loginScreen",
  };

  String get toName => appRoutes[this]!;
}

enum ApiRoutes {
  login,
}

extension ApiRouteExtension on ApiRoutes {
  static const apiRoutes = {
    ApiRoutes.login: "",
  };

  String get toName => apiRoutes[this]!;
}

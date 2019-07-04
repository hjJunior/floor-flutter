import 'package:fluro/fluro.dart';
import 'handlers/home_handler.dart';

class Application {
  static Router router;
}

class AppRoutesHandler {
  static final routesHandler = <RouteHandler>[
    HomeHandler(),
  ];

  static void configureRoutes(Router router) {
    routesHandler.forEach((routeHandler) {
      router.define(routeHandler.routePath, handler: routeHandler.handler);
    });
  }
}

abstract class RouteHandler {
  String routePath;
  Handler handler;
}
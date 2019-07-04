import 'package:fluro/fluro.dart';

import '../routes.dart';
import '../../scenes/home_scene.dart';
import '../../providers/home_provider.dart';

class HomeHandler implements RouteHandler {
  @override
  String routePath = '/';

  @override
  Handler handler = Handler(
    handlerFunc: (_, __) => HomeProvider(
      child: HomeScene(),
    )
  );
}

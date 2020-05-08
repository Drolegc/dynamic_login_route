import 'package:dynamicloginroute/init_screen_state.dart';
import 'package:flutter/material.dart';

class DynamicLoginRoute extends Route {

   Map<String,Widget> routes;
   Stream userState;
   Widget loginScreen;
   Widget loadingScreen;

  static DynamicLoginRoute _dynamicLoginRoute = DynamicLoginRoute._instance();

  factory DynamicLoginRoute() => _dynamicLoginRoute;

  factory DynamicLoginRoute.configuration({@required Map<String,Widget> routes,@required Stream userState,@required Widget loginScreen,@required Widget loadingScreen}){
    _dynamicLoginRoute.routes = routes;
    _dynamicLoginRoute.userState = userState;
    _dynamicLoginRoute.loginScreen = loginScreen;
    _dynamicLoginRoute.loadingScreen = loadingScreen;
    return _dynamicLoginRoute;
  }
   DynamicLoginRoute._instance():super();

  Route<dynamic> setRoutes(RouteSettings settings){

    String newRoute = settings.name;

    if(!routes.containsKey(newRoute))
      throw InvalidRoute();

    Widget newScreen = routes[newRoute];

    if(settings.name == "/")
      return MaterialPageRoute(builder: (_) => InitScreenState());

    return MaterialPageRoute(builder: (_) => newScreen);
  }

}

class InvalidRoute implements Exception{
  final String cause = "Route does not exist";
  InvalidRoute();
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dynamicloginroute/dynamic_login_route.dart';

void main() {

  test('getSingleton', () {
    var first = DynamicLoginRoute();
    var second = DynamicLoginRoute();
    expect((first==second), true);
  });

  test('getInvalidRouteException', (){
    DynamicLoginRoute dynamicLoginRoute = DynamicLoginRoute.configuration(
        routes:{
          '/':Scaffold(),
        } ,
        userState: Stream.empty(),
        loginScreen: Scaffold(),
        loadingScreen: Scaffold()
    );

    expect(() => dynamicLoginRoute.setRoutes(RouteSettings(name: '/invalid')),throwsException);
  });
}



import 'package:dynamicloginroute/dynamic_login_route.dart';
import 'package:flutter/material.dart';

class InitScreenState extends StatefulWidget {


  InitScreenState();

  @override
  _InitScreenStateState createState() => _InitScreenStateState();
}

class _InitScreenStateState extends State<InitScreenState> {

  final DynamicLoginRoute _dynamicLoginRoute = DynamicLoginRoute();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _dynamicLoginRoute.userState,
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(!snapshot.hasData || snapshot.hasError ){
            return _dynamicLoginRoute.loginScreen;
          }

          Future.delayed(Duration.zero,() => Navigator.of(context).pushNamed("/first"));
          return _dynamicLoginRoute.loadingScreen;
        },
      ),
    );
  }

}

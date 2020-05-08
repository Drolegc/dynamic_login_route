import 'package:dynamicloginroute/dynamic_login_route.dart';
import 'package:dynamicloginroute_example/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    DynamicLoginRoute.configuration(
        routes: {
          '/': null,
          '/first': First(),
          '/second': Second(),
        },
        loadingScreen: LoadingScreen(),
        loginScreen: Login(),
        userState: _userBloc.isLogued);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _userBloc,
      child: MaterialApp(
        onGenerateRoute: DynamicLoginRoute().setRoutes,
        initialRoute: '/',
      ),
    );
  }
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/second'),
      ),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/first'),
      ),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.error),
        onPressed: () => BlocProvider.of<UserBloc>(context).logIn(),
      ),
      body: Container(
        child: Center(
          child: Text("Login"),
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

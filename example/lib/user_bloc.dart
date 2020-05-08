import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserBloc extends Bloc{

  StreamController<bool> _controller;
  Stream<bool> isLogued;

  UserBloc(){
    _controller = StreamController.broadcast();
    _controller.sink.add(null);
    isLogued = _controller.stream;
  }

  void logIn(){
    _controller.sink.add(true);
  }

  @override
  void dispose() {
    _controller.close();
  }

}
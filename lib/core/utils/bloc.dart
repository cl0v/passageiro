import 'dart:async';

import 'error_handler.dart';

abstract class IBloc<T, G> {
  add(T obj);
  subscribe(Stream<T> s);
  addError(CustomError exception);
  dispose();
}

/// Forma facilitada de trabalhar com Eventos Stream
class Bloc<T> implements IBloc<T, Object> {
  final _controller = StreamController<T>();
  Stream<T> get stream => _controller.stream;

  late T _lastBeforeError;

  void add(T s) {
    if (!_controller.isClosed) {
      _lastBeforeError = s;
      _controller.add(s);
    }
  }

  subscribe(Stream<T> s) {
    if (!_controller.isClosed) {
      s.listen((v) => add(v));
    }
  }

  addError(CustomError exception) {
    if (!_controller.isClosed) {
      _controller.addError(exception);
    }
  }

  dispose() {
    _controller.close();
  }


  tryAgain(context, onPop) => _lastBeforeError == null ? onPop(context):
     _controller.add(_lastBeforeError);
}

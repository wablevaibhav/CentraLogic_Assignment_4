import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'screens_event.dart';
part 'screens_state.dart';

class ScreensBloc extends Bloc<ScreensEvent, ScreensState> {
  ScreensBloc() : super(ScreensInitial()) {
    on<ScreensEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:bookly/core/helper/log_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {

@override
  void onChange(BlocBase bloc, Change change) {
    logSuccess('current state: ${change.currentState}');
    super.onChange(bloc, change);
  }

}
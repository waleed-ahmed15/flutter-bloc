import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetSateCubit { initial, gained, lost }

class InternetCubit extends Cubit<InternetSateCubit> {
  Connectivity _connectivity = Connectivity();

  StreamSubscription? connectivitySubscription;
  InternetCubit() : super(InternetSateCubit.initial) {
    _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile) {
        emit(InternetSateCubit.gained);
      } else {
        emit(InternetSateCubit.lost);
      }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }
}

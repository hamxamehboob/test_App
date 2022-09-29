import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../Service/API_Response.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final APIResponse _apiResponse;
  HomeBloc(this._apiResponse) : super(HomeLoadingState()) {
    on<LoadAPIEVENT>((event, emit) async {
    final activity = await _apiResponse.getAPIRESPONSE();
    emit(HomeloadedState(activity.data[0].name, activity.data[1].name, activity.data[2].name));
    });
  }
}

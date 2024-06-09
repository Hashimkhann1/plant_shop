

import 'package:bloc/bloc.dart';
import 'package:plant_shop/view_model/bloc/loadin_bloc/loading_bloc_event/loading_bloc_event.dart';
import 'package:plant_shop/view_model/bloc/loadin_bloc/loading_bloc_state/loading_bloc_state.dart';

class LoadingBloc extends Bloc<LoadingBlocEvent , LoadingBlocState>{

  LoadingBloc() : super(LoadingBlocState()) {
    on<SetLoading>(_setLoading);
  }

  void _setLoading(SetLoading event , Emitter<LoadingBlocState> emit) {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

}
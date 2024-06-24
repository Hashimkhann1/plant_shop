

import 'package:bloc/bloc.dart';
import 'package:plant_shop/view_model/bloc/image_bloc/image_bloc_event/image_bloc_event.dart';
import 'package:plant_shop/view_model/bloc/image_bloc/image_bloc_state/image_bloc_state.dart';

class ImageBloc extends Bloc<ImageBlocEvent , ImageBlocState> {

  ImageBloc() : super(ImageBlocState()){
    on<PickImageFromGallery>(_pickImageFromGallery)
  }


  void _pickImageFromGallery(PickImageFromGallery event, Emitter emit){

  }

}
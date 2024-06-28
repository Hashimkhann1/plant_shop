

import 'package:bloc/bloc.dart';
import 'package:plant_shop/utils/constant/image_picker_utils/image_picker_utils.dart';
import 'package:plant_shop/view_model/bloc/image_bloc/image_bloc_event/image_bloc_event.dart';
import 'package:plant_shop/view_model/bloc/image_bloc/image_bloc_state/image_bloc_state.dart';

class ImageBloc extends Bloc<ImageBlocEvent , ImageBlocState> {

  final ImagePickerUtils imagePickerUtils;

  ImageBloc(this.imagePickerUtils) : super(ImageBlocState()){
    on<PickImageFromGallery>(_pickImageFromGallery);
  }


  void _pickImageFromGallery(PickImageFromGallery event, Emitter emit) async {

    final imagePath = await imagePickerUtils.pickImage();
    var f = await imagePath?.readAsBytes();

    emit(state.copyWith(imagePath: f));
  }

}
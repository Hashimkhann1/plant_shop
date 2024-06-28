


import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImageBlocState extends Equatable {

   final Uint8List? imagePath;

  const ImageBlocState({this.imagePath});

  ImageBlocState copyWith({Uint8List? imagePath}){
    return ImageBlocState(imagePath: imagePath ?? this.imagePath);
  }


  @override
  List<Object?> get props => [imagePath];
}



import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImageBlocState extends Equatable {

  final XFile? imagePath;

  const ImageBlocState({this.imagePath});

  ImageBlocState copyWith({XFile? imagePath}){
    return ImageBlocState(imagePath: imagePath ?? this.imagePath);
  }


  @override
  List<Object?> get props => [imagePath];
}
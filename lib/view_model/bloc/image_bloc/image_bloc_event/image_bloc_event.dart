


import 'package:equatable/equatable.dart';

abstract class ImageBlocEvent extends Equatable {

  ImageBlocEvent();

  @override
  List<Object?> get props => [];
}


class PickImageFromGallery extends ImageBlocEvent{}
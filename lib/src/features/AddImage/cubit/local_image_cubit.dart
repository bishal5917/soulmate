import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soulmate/src/core/app/texts.dart';

part 'local_image_state.dart';

class LocalImageCubit extends Cubit<LocalImageState> {
  LocalImageCubit() : super(const LocalImageState());

  final ImagePicker _picker = ImagePicker();
  XFile? _localImage;
  XFile? get localImage => _localImage;

  void pickImage(int gallery) async {
    try {
      emit(state.copyWith(
        message: imageLoadingText,
        status: LocalImageStatus.loading,
      ));
      final XFile? image = await _picker.pickImage(
        source: gallery == 1 ? ImageSource.gallery : ImageSource.camera,
      );
      int size = getFileSize(File(image?.path ?? ''));
      if (size > 5000000) {
        _localImage = null;
        emit(state.copyWith(
          message: fileSizeText,
          status: LocalImageStatus.failure,
        ));
        return;
      }
      if (image == null) {
        _localImage = null;
        emit(state.copyWith(
          message: selectImageText,
          status: LocalImageStatus.failure,
        ));
      } else {
        _localImage = image;
        emit(state.copyWith(
          message: imageSelectSuccessText,
          localImage: localImage,
          status: LocalImageStatus.success,
        ));
      }
    } on FileSystemException {
      _localImage = null;
      emit(state.copyWith(
        message: selectImageText,
        status: LocalImageStatus.failure,
      ));
    } catch (e) {
      _localImage = null;
      emit(state.copyWith(
        message: pleaseTryAgainText,
        status: LocalImageStatus.failure,
      ));
    }
  }

  int getFileSize(File? file) {
    return file?.lengthSync() ?? 0;
  }

  void removeImage() async {
    try {
      emit(state.copyWith(
        message: "Image loading",
        status: LocalImageStatus.loading,
      ));
      _localImage = null;
      emit(state.copyWith(
        message: "Image removed",
        status: LocalImageStatus.removed,
      ));
    } catch (e) {
      emit(state.copyWith(
        message: e.toString(),
        status: LocalImageStatus.failure,
      ));
    }
  }

  void initialImage() async {
    emit(state.copyWith(
      message: "Image Initial",
      status: LocalImageStatus.initial,
    ));
  }
}

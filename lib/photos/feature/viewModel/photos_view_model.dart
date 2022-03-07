import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import '../../core/base_view_model.dart';
import '../model/photos_model.dart';
import '../service/photos_service.dart';
part 'photos_view_model.g.dart';

class PhotosViewModel = _PhotosViewModelBase with _$PhotosViewModel;

abstract class _PhotosViewModelBase with Store, BaseViewModel {
  late IPhotosService photosService;

  @observable
  List<PhotosModel>? photosModel;
  @observable
  bool isLoading = true;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchPhotos() async {
    changeLoading();
    photosModel = await photosService.photosFetch();
    changeLoading();
  }

  @override
  void setContext(BuildContext context) {}

  @override
  void init() {
    photosService = PhotosService(networkManager);
    fetchPhotos();
  }
}

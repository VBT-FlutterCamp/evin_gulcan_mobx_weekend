import 'package:vexana/vexana.dart';

import '../model/photos_model.dart';

abstract class IPhotosService {
  late final INetworkManager networkManager;
  IPhotosService(this.networkManager);

  Future<List<PhotosModel>?> photosFetch();
}

class PhotosService extends IPhotosService {
  PhotosService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<PhotosModel>?> photosFetch() async {
    final response = await networkManager.send<PhotosModel, List<PhotosModel>>(
        'https://jsonplaceholder.typicode.com/photos',
        parseModel: PhotosModel(),
        method: RequestType.GET);
    return response.data;
  }
}

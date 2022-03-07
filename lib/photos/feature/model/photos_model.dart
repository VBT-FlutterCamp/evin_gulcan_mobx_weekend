import 'package:vexana/vexana.dart';

class PhotosModel extends INetworkModel<PhotosModel> {
  PhotosModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };

  @override
  fromJson(Map<String, dynamic> json) {
    return PhotosModel(
      albumId: json["albumId"],
      id: json["id"],
      title: json["title"],
      url: json["url"],
      thumbnailUrl: json["thumbnailUrl"],
    );
  }
}

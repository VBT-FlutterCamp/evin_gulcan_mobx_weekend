import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../core/base_view.dart';
import '../viewModel/photos_view_model.dart';

class PhotosView extends StatelessWidget {
  const PhotosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<PhotosViewModel>(
      viewModel: PhotosViewModel(),
      onModelReady: (model) {
        model.init();
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, PhotosViewModel viewModel) =>
          Scaffold(body: Observer(builder: (_) {
        return viewModel.isLoading
            ? SizedBox(
                height: context.dynamicHeight(0.9),
                child: _buildGridViewBuilder(viewModel),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      })),
    );
  }

  GridView _buildGridViewBuilder(PhotosViewModel viewModel) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: viewModel.photosModel?.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildCard(viewModel, index, context);
      },
    );
  }

  Card _buildCard(PhotosViewModel viewModel, int index, BuildContext context) {
    double _elevationCard = 10;
    return Card(
      elevation: _elevationCard,
      child: Column(
        children: [
          Text(viewModel.photosModel?[index].title ?? ''),
          SizedBox(
            height: context.dynamicHeight(0.2),
            child: Image(
              image: NetworkImage(viewModel.photosModel?[index].url ?? ''),
            ),
          ),
        ],
      ),
    );
  }
}

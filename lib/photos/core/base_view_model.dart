import 'package:flutter/widgets.dart';
import 'package:vexana/vexana.dart';

abstract class BaseViewModel {
  late BuildContext context;
  INetworkManager get networkManager => NetworkManager(options: BaseOptions());
  void setContext(BuildContext context);
  void init();
}

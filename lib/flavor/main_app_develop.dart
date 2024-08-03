import 'package:maze_app/main.dart';

import '../flavors.dart';


void main()  {
  F.appFlavor = Flavor.app_develop;
  commonMain(environment: F.appFlavor!.name);

}

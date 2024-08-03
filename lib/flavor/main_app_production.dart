import 'package:maze_app/main.dart';

import '../flavors.dart';


void main()  {
  F.appFlavor = Flavor.app_production;
  commonMain(environment: F.appFlavor!.name);

}

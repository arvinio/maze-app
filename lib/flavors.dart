enum Flavor {
  app_develop,
  app_production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.app_develop:
        return 'Maze App Dev';
      case Flavor.app_production:
        return 'Maze App';
      default:
        return 'title';
    }
  }

}

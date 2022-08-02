enum Flavor {
  DEV,
  UAT,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Bazar';
      case Flavor.UAT:
        return 'Bazar';
      case Flavor.PROD:
        return 'Bazar';
      default:
        return 'title';
    }
  }

}

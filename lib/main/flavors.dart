import 'package:projectr/shared/enums.dart';

///This class represents the configuration class with the different app flavor properties.
class F {
  String appName = '';
  int versionNumber = 1;
  Flavor flavor = Flavor.dev;

  static F shared = F.create();

  ///This method initilizes the app with the passed in configuration
  factory F.create({
    String appName = '',
    int versionNumber = 1,
    Flavor flavor = Flavor.dev,
  }) {
    return shared = F(appName, flavor, versionNumber);
  }

  F(this.appName, this.flavor, this.versionNumber);
}

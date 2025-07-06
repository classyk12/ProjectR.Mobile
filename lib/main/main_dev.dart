import 'package:projectr/main/app.dart';
import 'package:projectr/main/flavors.dart';
import 'package:projectr/shared/enums.dart';

void main() => loadApp(F.create(
      appName: "ProjectR Dev",
      versionNumber: 1,
      flavor: Flavor.dev,
    ));

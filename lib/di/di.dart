import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:the28awg/di/di.config.dart';

export 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() => $initGetIt(getIt);

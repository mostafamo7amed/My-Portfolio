import 'package:get_it/get_it.dart';
import '../services/firestore_service.dart';
import '../utils/cubit/portfolio_cubit.dart';
import '../utils/cubit/theme_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService());
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  getIt.registerFactory<PortfolioCubit>(
      () => PortfolioCubit(getIt<FirestoreService>()));
}

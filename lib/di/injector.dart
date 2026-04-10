import 'package:get_it/get_it.dart';
import '../core/api_client.dart';

import '../data/repository/student_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  getIt.registerLazySingleton<StudentRepository>(
    () => StudentRepository(apiClient: getIt<ApiClient>()),
  );
}
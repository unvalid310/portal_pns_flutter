// ignore_for_file: cascade_invocations

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:portal_pns_flutter/cubit/absensi/absensi_cubit.dart';
import 'package:portal_pns_flutter/cubit/apps/apps_cubit.dart';
import 'package:portal_pns_flutter/cubit/auth/auth_cubit.dart';
import 'package:portal_pns_flutter/cubit/berita/berita_cubit.dart';
import 'package:portal_pns_flutter/cubit/surat/surat_cubit.dart';
import 'package:portal_pns_flutter/data/datasource/remote/dio/dio_client.dart';
import 'package:portal_pns_flutter/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:portal_pns_flutter/data/repository/absensi_repo.dart';
import 'package:portal_pns_flutter/data/repository/apps_repo.dart';
import 'package:portal_pns_flutter/data/repository/auth_repo.dart';
import 'package:portal_pns_flutter/data/repository/berita_repo.dart';
import 'package:portal_pns_flutter/data/repository/surat_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await dotenv.load(fileName: '.env');

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());

  // Core
  getIt.registerLazySingleton(
    () => DioClient(dotenv.env['BASE_URL']!, getIt(),
        loggingInterceptor: getIt(), sharedPreferences: getIt()),
  );

  // Repository
  getIt.registerLazySingleton(
    () => AuthRepo(dioClient: getIt(), sharedPreferences: getIt()),
  );
  getIt.registerLazySingleton(
    () => AppsRepo(dioClient: getIt(), sharedPreferences: getIt()),
  );
  getIt.registerLazySingleton(
    () => BeritaRepo(dioClient: getIt()),
  );
  getIt.registerLazySingleton(
    () => AbsensiRepo(dioClient: getIt(), sharedPreferences: getIt()),
  );
  getIt.registerLazySingleton(
    () => SuratRepo(dioClient: getIt(), sharedPreferences: getIt()),
  );

  // cubit
  getIt.registerFactory<AuthCubit>(
      () => AuthCubit(authRepo: getIt(), sharedPreferences: getIt()));
  getIt.registerFactory<AppsCubit>(() => AppsCubit(appsRepo: getIt()));
  getIt.registerFactory<BeritaCubit>(() => BeritaCubit(beritaRepo: getIt()));
  getIt.registerFactory<AbsensiCubit>(() => AbsensiCubit(absensiRepo: getIt()));
  getIt.registerFactory<SuratCubit>(() => SuratCubit(suratRepo: getIt()));
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:portal_pns_flutter/data/model/mapps.dart';
import 'package:portal_pns_flutter/data/repository/apps_repo.dart';

part 'apps_state.dart';

class AppsCubit extends Cubit<AppsState> {
  final AppsRepo appsRepo;
  AppsCubit({required this.appsRepo}) : super(AppsInitial());

  Future<void> getApps() async {
    try {
      emit(AppsProgress());

      final apiResponse = await appsRepo.getApss();
      final response = apiResponse.response;

      List<Mapps> _listApps = [];

      if (response != null && response.statusCode == 200) {
        final _data = (response.data) as List;

        for (final apps in _data) {
          final temp = apps as Map<String, dynamic>;
          if (temp['apps'] == 'PNS' ||
              temp['apps'] == 'E-Sikam' ||
              temp['apps'] == 'Samber' ||
              temp['apps'] == 'PNS Kepegawaian' ||
              temp['apps'] == 'Agro Ceria') {
          } else {
            final mapps = Mapps.fromMap(apps);
            _listApps.add(mapps);
            print('Apps list : ${apps}');
          }
        }

        emit(
            AppsSuccess(apps: _listApps, message: 'data berhasil ditampilkan'));
      } else {}
    } catch (e) {
      print(e);
    }
  }
}

import 'dart:convert';

class AppConstants {
  // firebase endpoint
  static const String CREATE_TOPIC_URI =
      'https://iid.googleapis.com/iid/v1:batchAdd';
  static const String REMOVE_TOPIC_URI =
      'https://iid.googleapis.com/iid/v1:batchRemove';

  static const ID_USER = 'id_user';
  static const NIP = 'nip';
  static const NAMA = 'nama';
  static const UNIT_KERJA = 'unit_kerja';
  static const UNIT_ORGANISASI = 'unit_organisasi';
  static const USER_KATEGORI = 'user_kategori';
  static const PROFILE_PICTURE = 'profile_picture';
}

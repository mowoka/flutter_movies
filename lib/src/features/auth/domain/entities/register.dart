class RegisterEntity {
  var primaryData = RegisterPrimaryData();
  var additionalData = RegisterAddtionalData();
}

class RegisterPrimaryData {
  var email = '';
  var mobileNumber = '';
  DateTime birtdate = DateTime.now();
  var username = '';
  var favoriteCinema = FavoriteMovie.focalPoint;
}

class RegisterAddtionalData {
  var fullname = '';
  Gender gender = Gender.male;
  var address = '';
  var city = City.bandung;
  var mokaMovieNumber = '';
}

enum Gender {
  male('Male'),
  female('Female');

  final String label;
  const Gender(this.label);
}

enum FavoriteMovie {
  focalPoint('Focal Point'),
  rayaPadang('Raya Padang'),
  transmartPekanbaru('Transmart Pekanbaru'),
  studioPekanbaru('Studio Pekanbaru'),
  holidayPekanbaru('Holiday Pekanbaru'),
  grandBattamMall('Grand Battam Mall');

  final String label;
  const FavoriteMovie(this.label);
}

enum City {
  medan('Medan'),
  padang('Padang'),
  pekanbaru('Pekan Baru'),
  batam('Batam'),
  lampung('Lampung'),
  serang('Serang'),
  tangerang('Tangerang'),
  jakarta('Jakarta'),
  bandung('Bandung');

  final String label;
  const City(this.label);
}

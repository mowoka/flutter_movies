Future<List<String>> httpGetLocation() async {
  final res = await Future.delayed(const Duration(seconds: 2), () {
    return [
      'Medan',
      'Padang',
      'Pekanbaru',
      'Batam',
      'Palembang',
      'Lampung',
      'Serang',
      'Tangerang',
      'Tangerang City',
      'Tangerang Selatan',
      'Jakarta',
      'Depok',
      'Bogor',
      'Bekasi',
      'Cikarang',
      'Karawang',
      'Purwakarta',
      'Bandung',
      'Cimahi',
      'Cirebon',
      'Tegal'
    ];
  });
  return res;
}

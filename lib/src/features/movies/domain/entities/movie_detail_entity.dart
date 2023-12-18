class MovieDetailEntity {}

class MovieCinema {
  var title = 'Focal Point';
  var distance = '1527';
  List<MovieCinemaType> cinemaType = [
    MovieCinemaType()
      ..type = 'Reguler'
      ..price = 30000
      ..seatName = 'Audi 6'
      ..movieSchedule = [
        MovieCinemaSchedule()
          ..startTime = '12:00'
          ..endTime = '14:48'
          ..availableSeat = 132
          ..totalSeat = 132,
        MovieCinemaSchedule()
          ..startTime = '15:00'
          ..endTime = '17:48'
          ..availableSeat = 132
          ..totalSeat = 132,
        MovieCinemaSchedule()
          ..startTime = '18:00'
          ..endTime = '21:48'
          ..availableSeat = 132
          ..totalSeat = 132,
        MovieCinemaSchedule()
          ..startTime = '21:00'
          ..endTime = '23:48'
          ..availableSeat = 132
          ..totalSeat = 132,
      ],
    MovieCinemaType()
      ..type = 'Gold Class'
      ..price = 50000
      ..seatName = 'Gold Class 7'
      ..movieSchedule = [
        MovieCinemaSchedule()
          ..startTime = '14:45'
          ..endTime = '17:33'
          ..availableSeat = 40
          ..totalSeat = 40,
        MovieCinemaSchedule()
          ..startTime = '17:50'
          ..endTime = '20:38'
          ..availableSeat = 40
          ..totalSeat = 40
      ],
    MovieCinemaType()
      ..type = 'Gold Class'
      ..price = 50000
      ..seatName = 'Gold Class 7'
      ..movieSchedule = [
        MovieCinemaSchedule()
          ..startTime = '14:45'
          ..endTime = '17:33'
          ..availableSeat = 40
          ..totalSeat = 40,
        MovieCinemaSchedule()
          ..startTime = '17:50'
          ..endTime = '20:38'
          ..availableSeat = 40
          ..totalSeat = 40
      ],
    MovieCinemaType()
      ..type = 'Gold Class'
      ..price = 50000
      ..seatName = 'Gold Class 7'
      ..movieSchedule = [
        MovieCinemaSchedule()
          ..startTime = '14:45'
          ..endTime = '17:33'
          ..availableSeat = 40
          ..totalSeat = 40,
        MovieCinemaSchedule()
          ..startTime = '17:50'
          ..endTime = '20:38'
          ..availableSeat = 40
          ..totalSeat = 40
      ],
  ];
}

class MovieCinemaType {
  String type = '';
  int price = 0;
  String seatName = '';
  List<MovieCinemaSchedule> movieSchedule = [];
}

class MovieCinemaSchedule {
  String startTime = '';
  String endTime = '';
  int availableSeat = 0;
  int totalSeat = 0;
}

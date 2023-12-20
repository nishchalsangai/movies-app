import 'package:equatable/equatable.dart';

enum SeatType { selected, notAvailable, vip, regular }

// ignore: must_be_immutable
class SeatEntity extends Equatable {
  int colx;
  int rowx;
  bool available;
  SeatType seatType;

  SeatEntity(this.colx, this.rowx, this.available, this.seatType);

  @override
  List<Object?> get props => [colx, rowx, available, seatType];
}

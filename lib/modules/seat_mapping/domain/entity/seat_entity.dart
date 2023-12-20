import 'package:equatable/equatable.dart';


enum SeatType { selected, notAvailable, vip, regular }

class SeatEntity extends Equatable{
  int row;
  int col;
  bool available;
  SeatType seatType;

  SeatEntity(this.row, this.col, this.available, this.seatType);
  
  @override
 
  List<Object?> get props =>[row,col,available,seatType];
}

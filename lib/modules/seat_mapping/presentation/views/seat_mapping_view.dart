import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/app_theme.dart';
import 'package:movies_app/core/helpers/assets.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/modules/seat_mapping/domain/entity/seat_entity.dart';
import 'package:movies_app/modules/seat_mapping/presentation/widgets/seat_legends.dart';

class SeatMappingView extends StatefulWidget {
  const SeatMappingView(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  State<SeatMappingView> createState() => _SeatMappingViewState();
}

class _SeatMappingViewState extends State<SeatMappingView> {
  final TransformationController _transformationController =
      TransformationController();
  double _currentScale = 1.0;
  final double _scaleIncrement = 0.1;

  int totalRows = 24;
  int totalColumns = 10;

  List<SeatEntity> selectedSeats = [];
  List<SeatEntity> seats = [];

  @override
  void initState() {
    List<List>.generate(
        totalRows,
        (i) => List<dynamic>.generate(
            totalColumns,
            (index) => seatMaker(index, i)
                ? null
                : seats.add(SeatEntity(
                    i,
                    index,
                    i % 3 != 0 || index == 9,
                    index == 9
                        ? SeatType.vip
                        : i % 3 == 0 && index != 9
                            ? SeatType.notAvailable
                            : SeatType.regular)),
            growable: false),
        growable: false);

    super.initState();
  }

  void _zoomIn() {
    setState(() {
      _currentScale += _scaleIncrement;
      _transformationController.value = Matrix4.identity()
        ..scale(_currentScale);
    });
  }

  void _zoomOut() {
    setState(() {
      _currentScale = (_currentScale - _scaleIncrement).clamp(0.5, 4.0);
      _transformationController.value = Matrix4.identity()
        ..scale(_currentScale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.chipBackground,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: AppTheme.title,
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  widget.subtitle,
                  style:
                      const TextStyle(color: AppTheme.nearyBlue, fontSize: 12),
                ),
              ),
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: AppTheme.greyColorLight.withOpacity(0.1),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: InteractiveViewer(
                        transformationController: _transformationController,
                        boundaryMargin: const EdgeInsets.all(20.0),
                        minScale: 0.5,
                        maxScale: 4.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Center(child: Image.asset(Assets.ellipse)),
                                const Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Screen',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ...List.generate(
                                  totalRows,
                                  (index) => Padding(
                                    padding: EdgeInsets.only(
                                        right:
                                            index == 4 || index == 18 ? 8 : 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ...List.generate(
                                          totalColumns,
                                          (subIndex) {
                                            SeatEntity? seatValue;
                                            if (!seatMaker(subIndex, index)) {
                                              seatValue = seats.firstWhere(
                                                (element) =>
                                                    element.colx == index &&
                                                    element.rowx == subIndex,
                                              );
                                            }

                                            return Padding(
                                              padding: const EdgeInsets.all(2),
                                              child: seatMaker(subIndex, index)
                                                  ? const SizedBox(
                                                      height: 7,
                                                      width: 7,
                                                    )
                                                  : InkWell(
                                                      onTap: seatValue!
                                                              .available
                                                          ? () =>
                                                              updateSelectedSeats(
                                                                  seatValue)
                                                          : null,
                                                      child: Container(
                                                        height: 7,
                                                        width: 7,
                                                        color: selectedColor(
                                                            seatValue),
                                                      ),
                                                    ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: _zoomIn,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.horizontal_rule),
                            onPressed: _zoomOut,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: SeatLegends(
                          color: AppTheme.vibrantMustard,
                          title: 'Selected',
                        ),
                      ),
                      Expanded(
                        child: SeatLegends(
                          color: AppTheme.greyColor,
                          title: 'Not Available',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: SeatLegends(
                          color: AppTheme.vibrantPurple,
                          title: 'VIP (150\$)',
                        ),
                      ),
                      Expanded(
                        child: SeatLegends(
                          color: AppTheme.nearyBlue,
                          title: 'Regular (50\$)',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      ...List.generate(
                        selectedSeats.length,
                        (index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: AppTheme.boxDecoration,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: '${selectedSeats[index].colx} / ',
                                      children: [
                                        TextSpan(
                                            text:
                                                '${selectedSeats[index].rowx} row',
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black))
                                      ],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSeats
                                          .remove(selectedSeats[index]);
                                    });
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                  decoration: AppTheme.boxDecoration,
                  child: Column(
                    children: [
                      Text(
                        'Total Price',
                        style: context.textTheme.labelSmall!
                            .copyWith(fontSize: 10),
                      ),
                      Text(
                        '\$50',
                        style: context.textTheme.labelLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: AppTheme.styleFrom2,
                    child: Text(
                      'Proceed To Pay',
                      style: AppTheme.btnTxtStyle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void updateSelectedSeats(SeatEntity? seatValue) {
    setState(() {
      if (selectedSeats.contains(seatValue)) {
        selectedSeats.remove(seatValue);
      } else {
        selectedSeats.add(seatValue!);
      }
    });
  }

  Color selectedColor(SeatEntity seatValue) {
    return selectedSeats.contains(seatValue)
        ? AppTheme.vibrantMustard
        : seatValue.seatType == SeatType.regular
            ? AppTheme.nearyBlue
            : seatValue.seatType == SeatType.vip
                ? AppTheme.vibrantPurple
                : AppTheme.greyColor;
  }

  bool seatMaker(int subIndex, int index) {
    return (subIndex == 0 && (index >= 0 && index < 3) ||
            (subIndex == 0 && (index <= 24 && index > 21))) ||
        ((index == 0 && (subIndex >= 0 && subIndex < 4)) ||
            (index == 23 && (subIndex >= 0 && subIndex < 4)));
  }
}

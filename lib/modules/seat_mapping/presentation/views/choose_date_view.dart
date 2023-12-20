import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/helpers/app_theme.dart';
import 'package:movies_app/core/helpers/assets.dart';
import 'package:movies_app/core/helpers/extensions.dart';
import 'package:movies_app/core/router/route_path.dart';
import 'package:movies_app/core/widgets/app_barx.dart';

class ChooseDateView extends StatefulWidget {
  const ChooseDateView(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  State<ChooseDateView> createState() => _ChooseDateViewState();
}

class _ChooseDateViewState extends State<ChooseDateView> {
  late int selectedDate;
  late int selectedTime;
  @override
  void initState() {
    selectedDate = 0;
    selectedTime = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: widget.title,
        subtitle: widget.subtitle,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 90,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Dates',
                style: AppTheme.title,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    20,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: index == selectedDate
                              ? AppTheme.nearyBlue
                              : AppTheme.greyColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          DateTime.now().add(Duration(days: index)).toDay(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color:
                                  index == selectedDate ? Colors.white : null),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    4,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: '${index + 1}:30 pm',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: ' Cinetech + Hall ${index + 1}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.bodyTextColor),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(45),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: selectedTime == index
                                          ? AppTheme.nearyBlue
                                          : AppTheme.greyColor
                                              .withOpacity(0.35),
                                      width: 0.8),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(Assets.seat),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'From ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: AppTheme.bodyTextColor),
                                children: [
                                  TextSpan(
                                    text: '${50 + (index * 10)}\$',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  const TextSpan(
                                    text: ' or ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.bodyTextColor),
                                  ),
                                  TextSpan(
                                    text: '${2500 + (index * 500)} bonus',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(26),
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(RoutePath.seatMapping.name, queryParameters: {
              'title': widget.title,
              'subTitle': 'March 5, 2021  |  12:30 hall 1'
            });
          },
          style: AppTheme.styleFrom2,
          child: Text(
            'Select Seats',
            style: AppTheme.btnTxtStyle,
          ),
        ),
      ),
    );
  }
}

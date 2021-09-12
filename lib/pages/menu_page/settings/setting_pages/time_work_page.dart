import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:top_zone/widgets/custom_app_bar.dart';

class TimeWorkPage extends StatefulWidget {
  @override
  _TimeWorkPageState createState() => _TimeWorkPageState();
}

class _TimeWorkPageState extends State<TimeWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customShopAppBar(context, title: "أوقات العمل", withBack: true),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "الايام",
                    style: mediumStyle.copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "من",
                    style: mediumStyle.copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "الي",
                    style: mediumStyle.copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            tableTileWork(),
          ],
        ),
      ),
    );
  }

  Widget tableTileWork() {
    final df = new intl.DateFormat('hh:mm a');
    return Column(
      children: List.generate(weekDays.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.all(0),
                      icon: SvgPicture.asset(
                        weekDays[index].active == true
                            ? "assets/svg/checkBoxactive.svg"
                            : "assets/svg/unactive.svg",
                      ),
                      onPressed: () {
                        setState(() {
                          weekDays[index].active = !weekDays[index].active;
                        });
                      },
                    ),
                    Text(
                      weekDays[index].day,
                      style: mediumStyle.copyWith(
                        fontSize: 20,
                        color: weekDays[index].active == true
                            ? Colors.black
                            : Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    DatePicker.showTimePicker(
                      context,
                      showSecondsColumn: false,
                      showTitleActions: true,
                      onConfirm: (date) {
                        setState(() {
                          weekDays[index].from = df.format(date);
                        });
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.ar,
                    );
                  },
                  child: Text(
                    weekDays[index].from,
                    style: mediumStyle.copyWith(
                      fontSize: 20,
                      color: weekDays[index].active == true
                          ? Colors.black
                          : Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  weekDays[index].to,
                  style: mediumStyle.copyWith(
                    fontSize: 20,
                    color: weekDays[index].active == true
                        ? Colors.black
                        : Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  List<WeekDays> weekDays = [
    WeekDays(active: false, day: "الاحد", from: "00:00", to: "00:00"),
    WeekDays(active: false, day: "الاثنين", from: "00:00", to: "00:00"),
    WeekDays(active: false, day: "الثلاثاء", from: "00:00", to: "00:00"),
    WeekDays(active: false, day: "الاربعاء", from: "00:00", to: "00:00"),
    WeekDays(active: false, day: "الخميس", from: "00:00", to: "00:00"),
    WeekDays(active: false, day: "الجمعة", from: "00:00", to: "00:00"),
    WeekDays(active: false, day: "السبت", from: "00:00", to: "00:00"),
  ];
}

class WeekDays {
  String day;
  String from;
  String to;
  bool active;

  WeekDays({this.day, this.from, this.to, this.active});
}

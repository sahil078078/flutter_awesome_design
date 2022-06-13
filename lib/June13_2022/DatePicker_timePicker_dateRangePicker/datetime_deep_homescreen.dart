// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DateTimeDeepDiveHomeScreen extends StatefulWidget {
  const DateTimeDeepDiveHomeScreen({Key? key}) : super(key: key);

  @override
  State<DateTimeDeepDiveHomeScreen> createState() =>
      _DateTimeDeepDiveHomeScreenState();
}

class _DateTimeDeepDiveHomeScreenState
    extends State<DateTimeDeepDiveHomeScreen> {
  TimeOfDay time = TimeOfDay.now();

  // TimeOfDay time = TimeOfDay(hour: 10, minute: 10);
  DateTime date = DateTime.now();

  // for date and after select time
  DateTime dateTime = DateTime(2022, 6, 13, 6, 30, 52);
  @override
  Widget build(BuildContext context) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');

    final dateTimeHour = dateTime.hour.toString().padLeft(2, '0');
    final dateTimeMinute = dateTime.minute.toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "${date.day} / ${date.month} / ${date.year}",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              DateFormat('dd MMM yyyy').format(date),
              style: GoogleFonts.poly(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2200),
                );

                // if 'Cancel'
                if (newDate == null) return;
                // if 'Not Null'
                setState(() {
                  date = newDate;
                });
              },
              child: Text(
                'Select Date',
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            ),

            // time picker
            Text(
              'Time => $hour : $minute',
              style: GoogleFonts.poly(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? newTime = await showTimePicker(
                  context: context,
                  initialTime: time,
                );

                // if 'Cancel'
                if (newTime == null) return;
                // is 'Ok'
                setState(() {
                  time = newTime;
                });
              },
              child: Text(
                'Select Time',
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'Date And After Time Select',
              style: GoogleFonts.nunito(
                color: Colors.grey.withOpacity(0.85),
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: ElevatedButton(
                    onPressed: () async {
                      final date = await pickedDate();
                      if (date == null) return; // pressed Cancel

                      final newDateTime = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        dateTime.hour,
                        dateTime.minute,
                      );

                      setState(() => dateTime = newDateTime);
                    },
                    child: Text(
                      '${dateTime.day} - ${dateTime.month} - ${dateTime.year}',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: ElevatedButton(
                    onPressed: () async {
                      final time = await pickedTime();
                      if (time == null) return; // pressed Cancel

                      final newDateTime = DateTime(
                        dateTime.year,
                        // give date was selected previous otherwise it will select random date
                        dateTime.month,
                        dateTime.day,
                        time.hour,
                        time.minute,
                      );

                      setState(() {
                        dateTime = newDateTime;
                      });
                    },
                    child: Text(
                      '$dateTimeHour : $dateTimeMinute ',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: ElevatedButton(
                onPressed: () {
                  pickDateTime();
                },
                child: Text(
                    '${dateTime.day}/${dateTime.month}/${dateTime.year}   ${dateTimeHour} : ${dateTimeMinute}'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future pickDateTime() async {
    DateTime? date = await pickedDate();

    if (date == null) return; // pressed cancel

    TimeOfDay? time = await pickedTime();

    if (time == null) return; // pressed cancel

    final dateAndTime = DateTime(
      date.year,
      date.month,
      date.year,
      time.hour,
      time.minute,
    );

    setState(() {
      dateTime = dateAndTime;
    });
  }

  Future<TimeOfDay?> pickedTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.second),
      );

  Future<DateTime?> pickedDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(0000),
        lastDate: DateTime(3000),
      );
}

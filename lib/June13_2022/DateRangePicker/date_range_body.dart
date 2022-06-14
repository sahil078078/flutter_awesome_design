import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateRangeBody extends StatefulWidget {
  const DateRangeBody({Key? key}) : super(key: key);

  @override
  State<DateRangeBody> createState() => _DateRangeBodyState();
}

class _DateRangeBodyState extends State<DateRangeBody> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2022, 1, 1), // starting of 2022 it is start of range
    end: DateTime(2022, 12, 31), // ending of 2022 it is end og range
  );
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;
    // find diffrenece netween day

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Date Range',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                  onPressed: pickedDateRange,
                  child: Text(
                    // '${start.day} - ${start.month} - ${start.year}',
                    DateFormat('dd MMM yyyy').format(start),
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    // '${end.day} - ${end.month} - ${end.year}',
                    DateFormat('dd MMM yyyy').format(end),
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "Difference : ${difference.inDays} days",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Future pickedDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(0000), // minimum date we can select
      lastDate: DateTime(3000), // maximum date we can select
      initialDateRange: dateRange,
    );

    if (newDateRange == null) return; // id pressed 'Cancel'

    setState(() => dateRange = newDateRange);
  }
}

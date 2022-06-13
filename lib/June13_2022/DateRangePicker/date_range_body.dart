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
                  onPressed: () {},
                  child: Text(
                    '${start.day} - ${start.month} - ${start.year}',
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
                      '${end.day} - ${end.month} - ${end.year}',
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.black,
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

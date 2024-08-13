import 'package:flutter/material.dart';

enum Calendar { day, week, month, year }

enum Sizes { extraSmall, small, medium, large, extraLarge }

class SegmentedButtonScreen extends StatefulWidget {
  const SegmentedButtonScreen({super.key});

  @override
  State<SegmentedButtonScreen> createState() => _SegmentedButtonScreenState();
}

class _SegmentedButtonScreenState extends State<SegmentedButtonScreen> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segmented Button"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Text('Single choice'),
            SegmentedButton<Calendar>(
              segments: const <ButtonSegment<Calendar>>[
                ButtonSegment<Calendar>(value: Calendar.day, label: Text('Day'), icon: Icon(Icons.calendar_view_day)),
                ButtonSegment<Calendar>(
                    value: Calendar.week, label: Text('Week'), icon: Icon(Icons.calendar_view_week)),
                ButtonSegment<Calendar>(
                    value: Calendar.month, label: Text('Month'), icon: Icon(Icons.calendar_view_month)),
                ButtonSegment<Calendar>(value: Calendar.year, label: Text('Year'), icon: Icon(Icons.calendar_today)),
              ],
              selected: <Calendar>{calendarView},
              onSelectionChanged: (Set<Calendar> newSelection) {
                setState(() {
                  // By default there is only a single segment that can be
                  // selected at one time, so its value is always the first
                  // item in the selected set.
                  calendarView = newSelection.first;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Multiple choice'),
            SegmentedButton<Sizes>(
              segments: const <ButtonSegment<Sizes>>[
                ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
                ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
                ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
                ButtonSegment<Sizes>(
                  value: Sizes.large,
                  label: Text('L'),
                ),
                ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
              ],
              selected: selection,
              onSelectionChanged: (Set<Sizes> newSelection) {
                setState(() {
                  selection = newSelection;
                });
              },
              multiSelectionEnabled: true,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DateTimePickerScreen extends StatefulWidget {
  const DateTimePickerScreen({super.key});

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime? _selectedDate;
  DateTimeRange? _selectedDateRange;
  String? _startDate, _endDate;

  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDateRange: _selectedDateRange,
    );
    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
        _startDate = _selectedDateRange!.start.toString().split(' 00')[0];
        _endDate = _selectedDateRange!.end.toString().split(' 00')[0];
        print('$_startDate, $_endDate');
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date & Time Picker'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _selectedDate == null ? 'No date selected!' : 'Selected Date: ${_selectedDate!.toLocal()}'.split(' 00')[0],
              ),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Select Date'),
              ),
              const SizedBox(height: 20.0),
              Text(
                _selectedDateRange == null ? 'No date range selected!' : 'Selected date range: $_startDate ~ $_endDate',
              ),
              ElevatedButton(
                onPressed: () => _selectDateRange(context),
                child: const Text('Select Date Range'),
              ),
              const SizedBox(height: 20.0),
              Text(
                _selectedTime == null ? 'No time selected!' : 'Selected Time: ${_selectedTime!.format(context)}',
              ),
              ElevatedButton(
                onPressed: () => _selectTime(context),
                child: const Text('Select Time'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

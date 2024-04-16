import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TUIDatePicker extends StatefulWidget {
  final String placeholder;
  final String dateFormat;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final Function(DateTime)? dateSelected;

  const TUIDatePicker(
      {required this.placeholder,
      this.dateFormat = 'yyyy-MM-dd',
      this.minimumDate,
      this.maximumDate,
      this.dateSelected});

  @override
  State<TUIDatePicker> createState() => _TUIDatePickerState();
}

class _TUIDatePickerState extends State<TUIDatePicker> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      decoration: InputDecoration(
        labelText: widget.placeholder,
        prefixIcon: Icon(Icons.calendar_today),
      ),
      readOnly: true,
      onTap: () {
        _selectDate(context);
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: widget.minimumDate ?? DateTime(1900),
      lastDate: widget.maximumDate ?? DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat(widget.dateFormat).format(pickedDate);
        widget.dateSelected?.call(pickedDate);
      });
    }
  }
}

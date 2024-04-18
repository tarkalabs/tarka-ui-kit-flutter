import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarka_ui/components/textfield/text_field.dart';

enum InputType { date, time, both }

class TUIDatePicker extends StatefulWidget {
  final bool enabled;
  final bool readOnly;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? helperText;
  final String? prefixText;
  final String? suffixText;
  final material.TextAlign textAlign;
  final material.TextAlignVertical? textAlignVertical;
  final material.TextCapitalization textCapitalization;
  final material.TextDirection? textDirection;
  final material.Icon? prefixIcon;
  final material.Color? prefixIconColor;
  final material.Icon? suffixIcon;
  final material.Color? suffixIconColor;
  final material.TextEditingController? controller;
  final DateFormat? format;
  final DateTime? minimumDate;
  final DateTime? initialDate;
  final DateTime? maximumDate;
  final TimeOfDay? initialTime;
  final Function(DateTime)? dateSelected;
  final InputType inputType;
  final Locale? locale;
  final TransitionBuilder? transitionBuilder;

  const TUIDatePicker({
    super.key,
    this.enabled = true,
    this.readOnly = false,
    this.hintText,
    this.labelText,
    this.errorText,
    this.helperText,
    this.prefixText,
    this.suffixText,
    this.textAlign = material.TextAlign.start,
    this.textAlignVertical,
    this.textCapitalization = material.TextCapitalization.none,
    this.textDirection,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.controller,
    this.minimumDate,
    this.initialDate,
    this.maximumDate,
    this.dateSelected,
    this.inputType = InputType.both,
    this.format,
    this.locale,
    this.transitionBuilder,
    this.initialTime,
  });

  @override
  State<TUIDatePicker> createState() => _TUIDatePickerState();
}

class _TUIDatePickerState extends State<TUIDatePicker> {
  late TextEditingController _dateController;
  late DateFormat _dateFormat;

  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _dateController = widget.controller ?? material.TextEditingController();
    _dateFormat = widget.format ?? _getDefaultDateTimeFormat();
  }

  @override
  Widget build(BuildContext context) {
    return TUIInputField(
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      hintText: widget.hintText,
      labelText: widget.labelText,
      errorText: widget.errorText,
      helperText: widget.helperText,
      prefixText: widget.prefixText,
      suffixText: widget.suffixText,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textCapitalization: widget.textCapitalization,
      textDirection: widget.textDirection,
      prefixIcon: widget.prefixIcon,
      prefixIconColor: widget.prefixIconColor,
      suffixIcon: widget.suffixIcon,
      suffixIconColor: widget.suffixIconColor,
      controller: _dateController,
      onTap: () {
        _selectDate(context);
      },
    );
  }

  DateFormat _getDefaultDateTimeFormat() {
    final languageCode = widget.locale?.languageCode;
    switch (widget.inputType) {
      case InputType.time:
        return DateFormat.Hm(languageCode);
      case InputType.date:
        return DateFormat.yMd(languageCode);
      case InputType.both:
      default:
        return DateFormat.yMd(languageCode).add_Hms();
    }
  }

  Future<DateTime?> _showDatePicker(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: widget.minimumDate ?? DateTime(1900),
      lastDate: widget.maximumDate ?? DateTime(2100),
      locale: widget.locale,
      textDirection: widget.textDirection,
    );
  }

  Future<TimeOfDay?> _showTimePicker(BuildContext context) async {
    var builder = widget.transitionBuilder;
    if (widget.locale != null) {
      builder = (context, child) {
        var transitionBuilder = widget.transitionBuilder;
        return Localizations.override(
          context: context,
          locale: widget.locale,
          child: transitionBuilder == null
              ? child
              : transitionBuilder(context, child),
        );
      };
    }

    final timePickerResult = await showTimePicker(
      context: context,
      initialTime: widget.initialTime ?? TimeOfDay.fromDateTime(DateTime.now()),
      builder: builder,
    );

    return timePickerResult;
  }

  /// Sets the hour and minute of a [DateTime] from a [TimeOfDay].
  DateTime combine(DateTime date, TimeOfDay? time) => DateTime(
      date.year, date.month, date.day, time?.hour ?? 0, time?.minute ?? 0);

  DateTime? convert(TimeOfDay? time) =>
      time == null ? null : DateTime(1, 1, 1, time.hour, time.minute);

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate;
    switch (widget.inputType) {
      case InputType.date:
        pickedDate = await _showDatePicker(context);
        break;
      case InputType.time:
        if (!context.mounted) return;
        pickedDate = convert(await _showTimePicker(context));
        break;
      case InputType.both:
        if (!context.mounted) return;
        final date = await _showDatePicker(context);
        if (date != null) {
          if (!mounted) break;
          final time = await _showTimePicker(context);
          pickedDate = combine(date, time);
        }
        break;
      default:
        return;
    }

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = _dateFormat.format(_selectedDate!);
        widget.dateSelected?.call(_selectedDate!);
      });
    }
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: _selectedDate ?? (widget.initialDate ?? DateTime.now()),
  //     firstDate: widget.minimumDate ?? DateTime(1900),
  //     lastDate: widget.maximumDate ?? DateTime(2101),
  //   );
  //
  //   if (pickedDate != null && pickedDate != _selectedDate) {
  //     setState(() {
  //       _selectedDate = pickedDate;
  //       _dateController.text = DateFormat(widget.dateFormat).format(pickedDate);
  //       widget.dateSelected?.call(pickedDate);
  //     });
  //   }
  // }
}

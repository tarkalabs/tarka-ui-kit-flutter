import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tarka_ui/components/textfield/text_field.dart';

enum InputType { date, time, both }

class TUIDatePicker extends StatelessWidget {
  final bool enabled;
  final bool readOnly;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? helperText;
  final TUITextFieldStartEndItem? prefix;
  final TUITextFieldStartEndItem? suffix;
  final material.TextAlign textAlign;
  final material.TextAlignVertical? textAlignVertical;
  final material.TextCapitalization textCapitalization;
  final material.TextDirection? textDirection;
  final DateTime? minimumDate;
  final DateTime? initialDate;
  final DateTime? maximumDate;
  final TimeOfDay? initialTime;
  final Function(DateTime)? dateSelected;
  final InputType inputType;
  final Locale? locale;
  final TransitionBuilder? transitionBuilder;

  final TextEditingController _dateController;
  final DateFormat _dateFormat;

  TUIDatePicker({
    super.key,
    this.enabled = true,
    this.readOnly = false,
    this.hintText,
    this.labelText,
    this.errorText,
    this.helperText,
    this.prefix,
    this.suffix,
    this.textAlign = material.TextAlign.start,
    this.textAlignVertical,
    this.textCapitalization = material.TextCapitalization.none,
    this.textDirection,
    material.TextEditingController? controller,
    this.minimumDate,
    this.initialDate,
    this.maximumDate,
    this.dateSelected,
    this.inputType = InputType.both,
    DateFormat? format,
    this.locale,
    this.transitionBuilder,
    this.initialTime,
  })  : _dateController = controller ?? material.TextEditingController(),
        _dateFormat = format ??
            switch (inputType) {
              InputType.time => DateFormat.Hm(locale?.languageCode),
              InputType.date => DateFormat.yMd(locale?.languageCode),
              InputType.both => DateFormat.yMd(locale?.languageCode).add_Hms()
            };

  @override
  material.Widget build(BuildContext context) {
    if (initialDate != null || initialTime != null) {
      DateTime selectedDate;
      if (initialDate != null) {
        selectedDate = combine(initialDate!, initialTime);
      } else {
        selectedDate = convert(initialTime)!;
      }
      _dateController.text = _dateFormat.format(selectedDate);
    } else {
      _dateController.clear();
    }
    return TUIInputField(
      enabled: enabled,
      readOnly: readOnly,
      hintText: hintText,
      labelText: labelText,
      errorText: errorText,
      helperText: helperText,
      prefix: prefix,
      suffix: suffix,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textCapitalization: textCapitalization,
      textDirection: textDirection,
      controller: _dateController,
      onTap: () {
        _selectDate(context);
      },
      mouseCursor: WidgetStateMouseCursor.clickable,
      canRequestFocus: false,
      enableInteractiveSelection: false,
    );
  }

  Future<DateTime?> _showDatePicker(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: minimumDate ?? DateTime(1900),
      lastDate: maximumDate ?? DateTime(2100),
      locale: locale,
      textDirection: textDirection,
    );
  }

  Future<TimeOfDay?> _showTimePicker(BuildContext context) async {
    var builder = transitionBuilder;
    if (locale != null) {
      builder = (context, child) {
        var transitionBuilder = this.transitionBuilder;
        return Localizations.override(
          context: context,
          locale: locale,
          child: transitionBuilder == null
              ? child
              : transitionBuilder(context, child),
        );
      };
    }

    final timePickerResult = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.fromDateTime(DateTime.now()),
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
    switch (inputType) {
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
          if (!context.mounted) break;
          final time = await _showTimePicker(context);
          pickedDate = combine(date, time);
        }
        break;
      default:
        return;
    }

    if (pickedDate != null && pickedDate != initialDate) {
      dateSelected?.call(pickedDate);
    }
  }
}

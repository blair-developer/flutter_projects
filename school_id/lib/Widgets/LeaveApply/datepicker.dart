import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final TextEditingController controller;
  final Function onchanged;
  final Function saved;
  final Function validator;
  final String title;

  const CustomDatePicker(
      {required Key key,
      required this.controller,
      required this.onchanged,
      required this.saved,
      required this.validator,
      this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      type: DateTimePickerType.date,
      dateMask: 'dd/MM/yyyy',
      controller: controller,
      //initialValue: _initialValue,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      calendarTitle: "${title}",
      confirmText: "Confirm",
      enableSuggestions: true,
      //locale: Locale('en', 'US'),
      onChanged: onchanged,
      validator: validator,
      onSaved: saved,
    );
  }
}

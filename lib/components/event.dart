import 'package:flutter/material.dart';

class Event{
  final String title;
  final TimeOfDay time;
  const Event(this.title,this.time);
  @override
  String toString(){
    String hour = time.hour.toString().padLeft(2,'0');
    String minute = time.minute.toString().padLeft(2,'0');
    return '${hour}:${minute} - ${title}';
  }
}

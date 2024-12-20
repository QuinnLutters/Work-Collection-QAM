import 'package:virtual_buddy_app_design/components/event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPage();
}

class _CalendarPage extends State<CalendarPage> {
  DateTime today = DateTime.now();
  DateTime? selectedDate;
  Map<DateTime, List<Event>> events = {};
  TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> selectedEvents;
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    selectedDate = today;
    selectedEvents = ValueNotifier(getEventsForDay(selectedDate!));
  }

  void daySelected(DateTime date, DateTime focusedDay) {
    setState(() {
      selectedDate = date;
      today = focusedDay;
      selectedEvents.value = getEventsForDay(date);
    });
  }

  List<Event> getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 253, 255, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: content(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(241, 208, 10, 1),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                title: Text("Add new event"),
                content: Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: _eventController,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                          initialEntryMode: TimePickerEntryMode.dial);
                      if (timeOfDay != null) {
                        setState(() {
                          selectedTime = timeOfDay;
                        });
                      }
                    },
                    child: Text(
                        'Time: ${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}')),
                  ElevatedButton(
                      onPressed: () {
                        events.addAll({
                          selectedDate!: [Event(_eventController.text, selectedTime)]
                        });
                        Navigator.of(context).pop();
                        selectedEvents.value = getEventsForDay(selectedDate!);
                      },
                      child: Text("Submit"))
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TableCalendar(
            locale: "en_US",
            rowHeight: 43,
            headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
            focusedDay: today,
            selectedDayPredicate: (day) => isSameDay(selectedDate, day),
            firstDay: DateTime.utc(2024, 01, 01),
            lastDay: DateTime.utc(2024, 12, 31),
            onDaySelected: daySelected,
            eventLoader: getEventsForDay,
          ),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              border: Border.all(), borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            onTap: () => print(""),
                            title: Text('${value[index]}'),
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}

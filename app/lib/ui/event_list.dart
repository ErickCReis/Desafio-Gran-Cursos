import 'package:flutter/material.dart';

import 'package:app/models/Event.dart';
import 'package:app/services/list_events_service.dart';

class EventsList extends StatefulWidget {
  @override
  _EventsListState createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  dynamic events;

  @override
  void initState() {
    super.initState();
    _pullRefresh();
  }

  Future _pullRefresh() async {
    final eventsData = await listEventsService();
    setState(() {
      events = eventsData;
    });
  }

  Widget _eventList() {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(events[index].title),
          subtitle: Text(events[index].date.toIso8601String()),
        );
      },
    );
  }

  Widget _verifyResponse() {
    return events == null
        ? CircularProgressIndicator()
        : (events is List<Event> && events.isNotEmpty)
            ? _eventList()
            : Text("Nenhum evento encontrado");
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: _pullRefresh, child: _verifyResponse());
  }
}

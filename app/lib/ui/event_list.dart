import 'package:flutter/material.dart';

import 'package:app/entities/Event.dart';
import 'package:app/services/list_events_service.dart';

class EventsList extends StatefulWidget {
  @override
  _EventsListState createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  dynamic events;

  final titleTextStyle =
      TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold);

  final localTextStyle = TextStyle(color: Colors.white);

  final dateTextStyle = TextStyle(color: Colors.white, fontSize: 18);

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

  Widget _eventCard(Event _event) {
    return SizedBox(
      height: 150,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(fit: StackFit.passthrough, children: [
          Image.network(_event.imageUrl, fit: BoxFit.fill),
          Container(color: Colors.black54),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _event.title,
                  style: titleTextStyle,
                ),
                Text(
                  _event.local,
                  style: localTextStyle,
                ),
                Text(
                  _event.date,
                  style: dateTextStyle,
                ),
              ],
            ),
          ),
        ]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }

  Widget _eventList(List<Event> _events) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return _eventCard(_events[index]);
      },
    );
  }

  Widget _verifyResponse() {
    return events == null
        ? CircularProgressIndicator()
        : (events is List<Event> && events.isNotEmpty)
            ? _eventList(events)
            : Text("Nenhum evento encontrado");
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: _pullRefresh, child: _verifyResponse());
  }
}

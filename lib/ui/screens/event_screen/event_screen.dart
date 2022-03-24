import 'package:finsem_client/controller/api_controller.dart';
import 'package:finsem_client/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:finsem_client/ui/component/curved_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return CurvedAppBar(
      title: 'Post Events',
      child: FutureBuilder<List<Event>>(
        future: ApiController().fetchEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (snapshot.data != null) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, ind) {
                  return ListTile(
                    title: Text(
                      snapshot.data![ind].name,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      snapshot.data![ind].desc,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text('No Events'),
            );
          }
        },
      ),
    );
  }
}

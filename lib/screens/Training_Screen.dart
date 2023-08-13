import "package:flutter/material.dart";
import "package:flutter_application_1/navigation/bottom_Navigatr.dart";
import "package:flutter_application_1/navigation/menu_Drawer.dart";
import "package:flutter_application_1/data/session.dart";
import "../data/sp_Helper.dart";

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  SPHelper helper = SPHelper();
  List<Session> sessions = [];

  @override
  void initState() {
    // TODO: implement initState
    helper.init().then((_) {
      updateSession();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Training"),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const BottomNav(),
      body: ListView(
        children: getContent(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

// show alert modal
  Future<dynamic> showAlertDialog(BuildContext dialogContext) async {
    return showDialog(
        context: dialogContext,
        builder: (BuildContext showDialog) {
          return AlertDialog(
            title: const Text("Add a new session"),
            content: SingleChildScrollView(
              child: Column(children: [
                TextField(
                  controller: txtDescription,
                  decoration: const InputDecoration(
                      hintText: "Enter session description"),
                ),
                TextField(
                  controller: txtDuration,
                  decoration:
                      const InputDecoration(hintText: "Enter session duration"),
                )
              ]),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(showDialog);
                    txtDescription.text = '';
                    txtDuration.text = "";
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: saveSession, // functions that saves sessions
                  child: const Text("Save"))
            ],
          );
        });
  }

// function to save session to sharedPreferences
  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = "${now.day}-${now.month}-${now.year}";
    int id = helper.getIdCounter() + 1;
    Session newSession = Session(
        id, today, txtDescription.text, int.tryParse(txtDuration.text) ?? 0);
    helper.writeSession(newSession).then((_) {
      updateSession();
      helper.setIdCounter();
    });
    txtDescription.text = "";
    txtDuration.text = "";
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
     
    sessions.forEach((session) {
      tiles.add(
        ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(session.description),
            ),
            subtitle: Text(
                "Date: ${session.date} - Duration:${session.duration} min"),
            trailing: IconButton(
                onPressed: () {
                  helper.deleteSession(session.id);
                  updateSession();
                }, icon: const Icon(Icons.cancel_outlined))),
      );
    });

    return tiles;
  }

  void updateSession() {
    sessions = helper.getSessions();
    setState(() {});
  }
}

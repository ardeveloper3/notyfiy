import 'package:flutter/material.dart';
import 'package:notify/notificationsystem2/notificationsystem2.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:notify/notifications/notification.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await noty2().initializeNotifications();
  await NotificationService.init();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),

      darkTheme: ThemeData.dark(),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 250,),
            ElevatedButton(onPressed: (){
              NotificationService.showInstantNotification("Instant Notification", "This show an instant notificcation ");
            }, child: Text("Show notificatins")),

           const SizedBox(height: 12,),

            ElevatedButton(onPressed: (){
              DateTime sceduleDate = DateTime.now().add(const Duration(seconds: 5));

              NotificationService.scheduleNotification("Scedule Notification", "this is Scedule notification", sceduleDate);

           // NotificationService.ScheduleNotification(8, 31);

              // noty2().scheduleNotification(9, 07);

            }, child: Text("Show Scedule notificatins"))

          ],
        ),
      ),
    );
  }
}

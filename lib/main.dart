import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'alerts.dart';
import 'crop_data.dart';
import 'sensor_data.dart';

void main() {
  runApp(const AgriculturalDashboard());
}

late String stringr;

class AgriculturalDashboard extends StatelessWidget {
  const AgriculturalDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/agri.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to Dashboard',
                  style: GoogleFonts.lora(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    color: const Color.fromARGB(255, 0, 49, 90),
                  ),
                  textScaleFactor: 2,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Alerts and Notifications',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 0, 49, 90),
                  decorationColor: Colors.blue,
                  decorationThickness: 2,
                ),
              ),
              const SizedBox(height: 10),
              const Alerts(),
              const SizedBox(height: 20),
              const Text(
                'Sensor Data',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 0, 49, 90),
                  decorationColor: Colors.blue,
                  decorationThickness: 2,
                ),
              ),
              const SizedBox(height: 10),
              SensorDataScrollView(),
              const SizedBox(height: 20),
              const Text(
                'Your Crops',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color.fromARGB(255, 0, 49, 90),
                  decorationColor: Colors.blue,
                  decorationThickness: 2,
                ),
              ),
              const SizedBox(height: 10),
              const CropData(),
            ],
          ),
        ),
      ),
      floatingActionButton: const FloatingButtons(),
    );
  }
}

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({super.key});

  postData() async {
    try {
      var responsep = await http.post(
          Uri.parse("https://reqres.in/api/users"),
          body: {"name": "sethu"});
      debugPrint(responsep.body);
    } catch (e) {
      print(e.toString());
    }
    // stringr = responsep.body;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Text(stringr),
        Tooltip(
          message: 'Start irrigation',
          child: FloatingActionButton(
            onPressed: postData,
            child: const Icon(Icons.water),
          ),
        ),
        const SizedBox(height: 10),
        Tooltip(
          message: 'Drain Water Tanks',
          child: FloatingActionButton(
            onPressed: () {
              postData();
              // Drain water tanks
            },
            child: const Icon(Icons.all_out),
          ),
        ),
        const SizedBox(height: 10),
        Tooltip(
          message: 'Deploy Pest Control Robot',
          child: FloatingActionButton(
            onPressed: () {
              // Deploy pest control robot
            },
            child: const Icon(Icons.bug_report),
          ),
        ),
      ],
    );
  }
}

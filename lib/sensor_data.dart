import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/status.dart' as status;
// class SensorData extends StatelessWidget {
//   const SensorData({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const SensorDataScrollView(
//       humidity: '78%',
//       temperature: '26°C',
//       lightIntensity: '2500 lux',
//       airPressure: '101.3 kPa',
//       soilMoisture: 'Medium',
//     );
//   }
// }

class SensorDataScrollView extends StatefulWidget {
  // final String temperature;
  // final String humidity;
  // final String lightIntensity;
  // final String airPressure;
  // final String soilMoisture;

  // const SensorDataScrollView({
  //   Key? key,
  //   required this.temperature,
  //   required this.humidity,
  //   required this.lightIntensity,
  //   required this.airPressure,
  //   required this.soilMoisture,
  // }) : super(key: key);

  @override
  _SensorDataScrollViewState createState() => _SensorDataScrollViewState();
}

late String stringResponse;
late Map mapResponse;
late Map dataResponse;
late List listResponse;
late List listnew;
late List<String> words;
late String nextWord;

class _SensorDataScrollViewState extends State<SensorDataScrollView> {
  Future<void> apicall() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        try {
          mapResponse = json.decode(response.body) as Map<String, dynamic>;
        } catch (e) {
          print('Error decoding JSON: $e');
          // mapResponse = null; // Set mapResponse to null if there's an error in decoding
        }
      });
    } else {
      print('API request failed with status code: ${response.statusCode}');
    }
  }

  

  // Future apicall() async {
  //   http.Response response;
  //   response = await http
  //       .get(Uri.parse("http://localhost:9200/iewtest.logstash/_search"));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       stringResponse = response.body;

  //       mapResponse = json.decode(response.body);
  // listResponse = mapResponse['hits'];
  // listResponse = json.decode(response.body);
  // listnew = listResponse[2];
  // listnew = listResponse[0];
  // for (String line in stringResponse) {
  // List<String> words = stringResponse.split('');
  // for (int i = 0; i < words.length - 1; i++) {
  //   print(words[i]);
  //   if (words[i] == '"last_name"') {
  //     nextWord = words[i + 1];
  //     print(nextWord);
  //     break;
  //   }
  // }
  // }
  //     });
  //   }
  // }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  // child: Row(
  //   children: [
  //     SensorDataCard(
  //       dataLabel: 'Temperature',
  //       dataValue: widget.temperature,
  //       icon: Icons.thermostat_outlined,
  //     ),
  //     SensorDataCard(
  //       dataLabel: 'Humidity',
  //       dataValue: widget.humidity,
  //       icon: Icons.opacity_outlined,
  //     ),
  //     SensorDataCard(
  //       dataLabel: 'Light Intensity',
  //       dataValue: widget.lightIntensity,
  //       icon: Icons.lightbulb_outline,
  //     ),
  //     SensorDataCard(
  //       dataLabel: 'Air Pressure',
  //       dataValue: widget.airPressure,
  //       icon: Icons.cloud_outlined,
  //     ),
  //     SensorDataCard(
  //       dataLabel: 'Soil Moisture',
  //       dataValue: widget.soilMoisture,
  //       icon: Icons.wb_sunny_outlined,
  //     ),
  //   ],
  // ),

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        height: 200,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   icon,
            //   size: 40,
            // ),
            const SizedBox(height: 10),
            // mapResponse==null
            // ?Container()
            Text(
              // mapResponse['authors'].toString(),
              stringResponse,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            // const SizedBox(height: 10),
            // Text(
            //   dataValue,
            //   style: const TextStyle(
            //     fontSize: 24,
            //     color: Colors.blue,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


// class SensorDataCard extends StatelessWidget {
//   final String dataLabel;
//   final String dataValue;
//   final IconData icon;

//   const SensorDataCard({
//     Key? key,
//     required this.dataLabel,
//     required this.dataValue,
//     required this.icon,
//   }) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     child: Container(
  //       width: 150,
  //       height: 200,
  //       color: Colors.white,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(
  //             icon,
  //             size: 40,
  //           ),
  //           const SizedBox(height: 10),
  //           Text(
  //             dataLabel,
  //             style: const TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 18,
  //             ),
  //           ),
  //           const SizedBox(height: 10),
  //           Text(
  //             dataValue,
  //             style: const TextStyle(
  //               fontSize: 24,
  //               color: Colors.blue,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
// }




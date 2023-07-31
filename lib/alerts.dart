import 'package:flutter/material.dart';

class Alerts extends StatelessWidget {
  const Alerts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        // const Text(
        //   'Alerts and Notifications',
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 24,
        //     color: Color.fromARGB(255, 0, 49, 90),
        //     decorationColor: Colors.blue,
        //     decorationThickness: 2,
        //   ),
        // ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            itemCount: 3, // Number of alerts or notifications
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  color: const Color.fromARGB(255, 181, 230, 255),
                  child: ListTile(
                    leading: const Icon(Icons.warning),
                    title: const Text('Extreme Weather Alert'),
                    subtitle: const Text(
                      'Expected heavy rainfall in the next 24 hours.',
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Handle alert click
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

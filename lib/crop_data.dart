import 'package:flutter/material.dart';

class CropData extends StatelessWidget {
  const CropData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        itemCount: 3, // Number of crops
        itemBuilder: (context, index) {
          return const CropCard(
            cropName: 'Crop 1',
            cropImage: AssetImage('assets/images/crop.jpg'),
            growthStage: 'Stage: Vegetative',
            healthStatus: 'Healthy',
          );
        },
      ),
    );
  }
}

class CropCard extends StatefulWidget {
  final String cropName;
  final ImageProvider cropImage;
  final String growthStage;
  final String healthStatus;

  const CropCard({
    Key? key,
    required this.cropName,
    required this.cropImage,
    required this.growthStage,
    required this.healthStatus,
  }) : super(key: key);

  @override
  _CropCardState createState() => _CropCardState();
}

class _CropCardState extends State<CropCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.cropImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.cropName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.growthStage,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.healthStatus,
              style: TextStyle(
                fontSize: 14,
                color: widget.healthStatus.contains('Healthy')
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

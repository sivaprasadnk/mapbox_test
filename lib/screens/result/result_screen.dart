import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:machine_test/utils/common_colors.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.start, required this.end});
  final String start;
  final String end;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  MapboxMap? mapboxMap;

  _onMapCreated(MapboxMap mapboxMap) {
    this.mapboxMap = mapboxMap;
  }

  // This function searches for a location using an address and animates the map camera to that location
  Future<void> searchLocation(String query) async {
    // var query = _startController.text;

    const int maxRetries = 3;
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        List<Location> locations = await locationFromAddress(query);

        if (locations.isNotEmpty) {
          final location = locations.first;
          mapboxMap!.setCamera(CameraOptions(
            center: Point(
              coordinates: Position(
                location.longitude,
                location.latitude,
              ),
            ).toJson(),
            zoom: 12.0,
          ));
          return;
        }
      } catch (e) {
        debugPrint('Error searching location: $e');
        retryCount++;
        await Future.delayed(
            const Duration(seconds: 2)); // Wait before retrying
      }
    }
    debugPrint('Failed to search location after $maxRetries attempts.');
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      // searchLocation(widget.start);
      // searchLocation(widget.end);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                width: double.infinity,
                height: 450,
                child: MapWidget(
                  key: const ValueKey("mapWidget"),
                  onResourceRequestListener: (resourceEventData) {},
                  onCameraChangeListener: (cameraChangedEventData) {},
                  onMapCreated: _onMapCreated,
                  cameraOptions: CameraOptions(
                    center: Point(
                      coordinates: Position(76.3464, 9.9377),
                    ).toJson(),
                    zoom: 12.0,
                  ),
                )),
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 100),
                const Text(
                  'Your location',
                  style: TextStyle(
                    fontSize: 10,
                    color: kWhiteColor,
                  ),
                ),
                Text(
                  widget.start,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kWhiteColor,
                  ),
                ),
                const Divider(
                  indent: 0,
                  color: kWhiteColor,
                  endIndent: 15,
                ),
                Text(
                  widget.end,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kWhiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: 70,
      child: Center(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 30,
            width: 70,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Center(
              child: Text(
                'Save',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:le_eats/utils/app_constant.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String _location = 'Press the button to get location';
  String _locationName = 'Fetching location name...';
  String _distance = 'Distance: 0 km';

  // Predefined destination coordinates (example),
  double destLat = 10.802994;
  double destLon = 76.217890;

  // Function to get current location and fetch location name
  Future<void> _getCurrentLocation() async {
    try {
      // Request location permission
      LocationPermission permission = await Geolocator.requestPermission();

      // Check if permission is granted
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setState(() {
          _location = 'Location permission denied.';
        });
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _location =
            'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
      });

      // Fetch location name based on latitude and longitude
      await _fetchLocationName(position.latitude, position.longitude);

      double distance = calculateHaversineDistance(
          position.latitude, position.longitude, destLat, destLon);

      setState(() {
        _distance = 'Distance: ${distance.toStringAsFixed(2)} km';
      });
    } catch (e) {
      setState(() {
        _location = 'Error: ${e.toString()}';
      });
    }
  }

  // Function to calculate distance using Haversine formula
  double calculateHaversineDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const double R = 6371; // Radius of the Earth in km

    // Convert degrees to radians
    double lat1Rad = _degToRad(lat1);
    double lon1Rad = _degToRad(lon1);
    double lat2Rad = _degToRad(lat2);
    double lon2Rad = _degToRad(lon2);

    // Differences between latitudes and longitudes
    double deltaLat = lat2Rad - lat1Rad;
    double deltaLon = lon2Rad - lon1Rad;

    // Haversine formula
    double a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(lat1Rad) * cos(lat2Rad) * sin(deltaLon / 2) * sin(deltaLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Distance in km
    double distance = R * c;
    return distance;
  }

  // Helper function to convert degrees to radians
  double _degToRad(double deg) {
    return deg * (pi / 180);
  }

  // Function to fetch location name from latitude and longitude
  Future<void> _fetchLocationName(double latitude, double longitude) async {
    String url =
        'https://nominatim.openstreetmap.org/reverse?lat=$latitude&lon=$longitude&format=json';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          _locationName = data['display_name'] ?? 'Unknown location';
        });
      } else {
        setState(() {
          _locationName = 'Failed to fetch location';
        });
      }
    } catch (e) {
      setState(() {
        _locationName = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFEFEEF3),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff000000),
          ), // Bell icon
          onPressed: () {
            // Add functionality for the bell icon here
            print("Bell icon pressed");
          },
        ),
        title: Text(
          'Add Address',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              fontFamily: GoogleFonts.roboto().fontFamily,
              color: Color(0xff000000)),
          // Centered text
        ),
        centerTitle: true, // Center the title
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_rounded,
              color: Color(0xFFC10037),
            ), // Back button
            onPressed: () {
              // Add functionality for back button here
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add an image here
              Image.asset(
                map, // Path to your local image
                height: 200, // Adjust height as needed
                width: 380, // Adjust width as needed
                fit: BoxFit.cover, // Control how the image is displayed
              ),
              SizedBox(height: 20), // Add spacing
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                  mainAxisAlignment: MainAxisAlignment.center, // Vertically center the content
                  children: [
                    Text(
                      'Delivery Location',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5), // Add spacing between texts
                    Text(
                      'F Block, 123 Main Street, New York, NY10030',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30,),
                   Text(
                        'Street/Flat/Society',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF374B5C),
                        ),
                      ),

                    TextField(
                      decoration: InputDecoration(
                        // hintText: 'Enter your phone no',
                        hintStyle: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: Color(0xffDADADA), // Change this to your desired color
                          fontSize: 20, // Optional: Adjust font size
                          fontWeight: FontWeight.w500, // Optional: Adjust font weight
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Color(0xFFEFEEF3),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Landmark',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF374B5C),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Landmark',
                        hintStyle: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: Color(0xffDADADA), // Change this to your desired color
                          fontSize: 20, // Optional: Adjust font size
                          fontWeight: FontWeight.w500, // Optional: Adjust font weight
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Color(0xFFEFEEF3),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Save As",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Align buttons to the left
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Add functionality for "Work" button
                              print("Work button pressed");
                            },
                            style: ElevatedButton.styleFrom(
                              // backgroundColor: Color(0xFFC10037), // Button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                              padding: EdgeInsets.symmetric(vertical: 15), // Adjust padding
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Center align icon and text
                              children: [
                                Icon(
                                  Icons.home, // Use any icon here
                                  color: Color(0xFFEF2E2E), // Icon color
                                  size: 20, // Adjust icon size
                                ),
                                SizedBox(width: 8), // Space between icon and text
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFEF2E2E), // Text color
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(width: 10), // Space between buttons
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Add functionality for "Work" button
                              print("Work button pressed");
                            },
                            style: ElevatedButton.styleFrom(
                              // backgroundColor: Color(0xFFC10037), // Button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                              padding: EdgeInsets.symmetric(vertical: 15), // Adjust padding
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Center align icon and text
                              children: [
                                Icon(
                                  Icons.work, // Use any icon here
                                  color: Color(0xff979797), // Icon color
                                  size: 20, // Adjust icon size
                                ),
                                SizedBox(width: 8), // Space between icon and text
                                Text(
                                  "Work",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:Color(0xff979797),  // Text color
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              ),
          SizedBox(height: 35,),
          Padding(
            padding: const EdgeInsets.all(5.0), // Add padding around the Save button
            child: SizedBox(
              width: double.infinity, // Make the button stretch across the screen
              child: ElevatedButton(
                onPressed: () {
                  print("Save button pressed");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC10037),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  "Save Address",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
            ],

          ),
        ),

      ),

    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Location Example"),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         const Text(
    //           'Your current location:',
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(16.0),
    //           child: Text(
    //             _location,
    //             textAlign: TextAlign.center,
    //             style: Theme.of(context).textTheme.bodyLarge,
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         Text(
    //           'Location Name: $_locationName',
    //           textAlign: TextAlign.center,
    //           style: Theme.of(context).textTheme.bodyLarge,
    //         ),
    //         const SizedBox(height: 20),
    //         Text(
    //           _distance,
    //           textAlign: TextAlign.center,
    //           style: Theme.of(context).textTheme.bodyLarge,
    //         ),
    //         ElevatedButton(
    //           onPressed: _getCurrentLocation,
    //           child: const Text('Get Location'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

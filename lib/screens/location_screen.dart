// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart'; // Add this package for location

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  TextEditingController userCityInput = TextEditingController();
  String cityName = '';
  String imageUrl = '';
  bool isLoading = true;

  double temp = 0.0;
  String weatherMain = '';
  String weatherDescription = '';

  @override
  void initState() {
    super.initState();
    // Request location permission and get weather when the app starts
    _getLocationAndWeather();
  }

  // Function to handle location permission and get current location
  Future<void> _getLocationAndWeather() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Check location permission

      print('Checking location permission');
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, show a message to the user
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Location permissions are denied')),
          );
          setState(() {
            isLoading = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are permanently denied, show a message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Location permissions are permanently denied, please enable in settings'),
          ),
        );
        setState(() {
          isLoading = false;
        });
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get weather data using coordinates
      getWeatherByCoordinates(position.latitude, position.longitude);
    } catch (e) {
      print('Error getting location: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error getting location: $e')),
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  // Function to get weather data using coordinates
  void getWeatherByCoordinates(double lat, double lon) async {
    print('Fetching weather data for coordinates: $lat, $lon');

    try {
      var uri = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=158361e56f89385856d40093de91ffd1");
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);

        double kelvinTemp = decode['main']['temp'];
        String iconUrl = decode['weather'][0]['icon'];
        String weatherMainText = decode['weather'][0]['main'];
        String weatherDescriptionText = decode['weather'][0]['description'];
        String city = decode['name']; // Get city name from coordinates

        // Convert Kelvin to Celsius
        double celsiusTemp = kelvinTemp - 273.15;

        setState(() {
          cityName = city;
          temp = celsiusTemp;
          weatherMain = weatherMainText;
          weatherDescription = weatherDescriptionText;
          imageUrl = 'https://openweathermap.org/img/wn/$iconUrl@2x.png';
          isLoading = false;
        });

        print('City: $cityName');
        print('Temp (Celsius): $temp');
        print('Weather Main: $weatherMain');
        print('Weather Description: $weatherDescription');
      } else {
        print('Error: ${response.statusCode}');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching weather: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  // Original function to get weather by city name (kept for manual search)
  void getCityLocationInformation(String cityName) async {
    print('Fetching weather data for: $cityName');
    setState(() {
      isLoading = true;
    });

    try {
      var uri = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=158361e56f89385856d40093de91ffd1");
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);

        double kelvinTemp = decode['main']['temp'];
        String iconUrl = decode['weather'][0]['icon'];
        String weatherMainText = decode['weather'][0]['main'];
        String weatherDescriptionText = decode['weather'][0]['description'];

        // Convert Kelvin to Celsius
        double celsiusTemp = kelvinTemp - 273.15;

        setState(() {
          temp = celsiusTemp;
          weatherMain = weatherMainText;
          weatherDescription = weatherDescriptionText;
          imageUrl = 'https://openweathermap.org/img/wn/$iconUrl@2x.png';
          isLoading = false;
        });

        print('Temp (Celsius): $temp');
        print('Weather Main: $weatherMain');
        print('Weather Description: $weatherDescription');
      } else {
        print('Error: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('City not found')),
        );
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching weather: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: _getLocationAndWeather,
            tooltip: 'Get Current Location',
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: imageUrl.isNotEmpty
                              ? ClipOval(
                                  child: Image.network(imageUrl,
                                      fit: BoxFit.cover))
                              : const Center(
                                  child: Icon(Icons.image, size: 50),
                                ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        cityName.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Temperature: ${temp.toStringAsFixed(2)}°C',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Weather Main: $weatherMain',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Weather Description: $weatherDescription',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  )),
                  const SizedBox(height: 80),
                  Container(
                    width: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: userCityInput,
                            decoration: const InputDecoration(
                              labelText: 'Enter City Name',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            if (userCityInput.text.trim().isNotEmpty) {
                              setState(() {
                                cityName = userCityInput.text;
                                getCityLocationInformation(
                                    cityName.toLowerCase());
                              });
                            }
                          },
                          child: const Text('Search City'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

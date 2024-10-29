import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> allLocations = [
    {'city': 'Barcelona', 'country': 'Spain'},
    {'city': 'Madrid', 'country': 'Spain'},
    {'city': 'London', 'country': 'United Kingdom'},
    {'city': 'Berlin', 'country': 'Germany'},
    {'city': 'Rome', 'country': 'Italy'},
    {'city': 'Paris', 'country': 'France'},
    {'city': 'New York', 'country': 'United States'},
    {'city': 'Tokyo', 'country': 'Japan'},
    {'city': 'Beijing', 'country': 'China'},
    {'city': 'Moscow', 'country': 'Russia'},
    // Add more cities and countries as needed
  ];
  List<Map<String, String>> filteredLocations = [];

  @override
  void initState() {
    super.initState();
    filteredLocations = allLocations; // Start with showing all locations
    _searchController.addListener(_filterLocations);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterLocations);
    _searchController.dispose();
    super.dispose();
  }

  void _filterLocations() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredLocations = allLocations.where((location) {
        final cityLower = location['city']!.toLowerCase();
        final countryLower = location['country']!.toLowerCase();
        return cityLower.contains(query) || countryLower.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextField(
          controller: _searchController,
          autofocus: true, // Automatically open keyboard
          decoration: InputDecoration(
            hintText: 'Select Location...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: Icon(Icons.search, color: Colors.grey),
          ),
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Most Searched',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: filteredLocations.length,
                itemBuilder: (context, index) {
                  final location = filteredLocations[index];
                  return ListTile(
                    title: Text(
                      location['city']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      location['country']!,
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      // Handle location selection
                      Navigator.pop(context, location); // Pass selected location back
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

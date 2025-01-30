```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the API returns a JSON array
      final jsonData = jsonDecode(response.body);
      // Incorrect assumption: jsonData is treated as a List<Map<String, dynamic>>
      // even if the API returns a different structure.
      for (var item in jsonData) {
        print(item['name']); //Error if the response is not a List<Map<String, dynamic>> 
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```
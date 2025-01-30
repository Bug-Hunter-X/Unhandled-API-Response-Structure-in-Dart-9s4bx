```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final responseBody = response.body;
      // Check if it's a valid JSON
      try{
        final jsonData = jsonDecode(responseBody);
          if (jsonData is List) {
            for (var item in jsonData) {
              if (item is Map && item.containsKey('name')) {
                print(item['name']);
              } else {
                print('Unexpected item structure in JSON array: $item');
              }
            }
          } else if (jsonData is Map) {
            //Handle the case where the JSON is a map
            print(jsonData['name']);
          } else {
            print('Unexpected JSON structure: $jsonData');
          }
      } catch(e) {
        print('Invalid JSON format: $e');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```
```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process jsonData
      return jsonData; // Return the processed data
    } else {
      // Handle error more robustly
      throw Exception('Failed to load data: ${response.statusCode} - ${response.body}');
    }
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('JSON decoding error: $e');
    rethrow; 
  } on SocketException catch (e) {
    // Handle network errors
    print('Network error: $e');
    rethrow;
  } catch (e) {
    print('An unexpected error occurred: $e');
    rethrow; // Re-throw to allow higher-level handling
  }
}
```
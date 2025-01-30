# Unhandled API Response Structure in Dart

This repository demonstrates a common error in Dart applications that handle API responses: assuming a specific JSON structure without proper error handling.

The `bug.dart` file contains code that attempts to process an API response, assuming the response is a JSON array of maps. If the actual response has a different structure, the code throws an exception or may produce unexpected behavior. 

The `bugSolution.dart` demonstrates improved error handling, which checks the response structure and handles unexpected cases gracefully.
# Weather Forecast App

Weather Forecast Application created using [OpenWeatherMap](https://openweathermap.org/) API in [Flutter](https://flutter.dev/) with [BLoC Pattern](https://pub.dev/packages/flutter_bloc).

<p align="center"><img src="https://user-images.githubusercontent.com/69586214/227187851-911c67b6-0a97-44fb-a392-0cb85edbdbc7.png" /></p>



## 💫 Features
- Beautiful UI design
- Automatically determine current user location
- Today weather info
- Weather forecast for 7 days
- Search location


## 💻 How to Run
1. Create an account at [OpenWeatherMap](https://openweathermap.org/).
2. Get your API key from https://home.openweathermap.org/api_keys.
3. Clone the repository
4. Install all the packages by typing
   ```sh
   flutter pub get
   ```
5. Navigate to **lib/data/provider/weather_provider.dart** and paste your API key to the apiKey variable
   ```dart
   final apiKey = 'Paste Your API Key Here';
   ```
6. Run the App

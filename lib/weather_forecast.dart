import 'package:flutter/material.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/network/network.dart';
import 'package:weather_forecast_app/ui/bottom_view.dart';
import 'package:weather_forecast_app/ui/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {

  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Mumbai";

  @override
  void initState() {
    super.initState();
    forecastObject = getWeather(_cityName);
    /// when we print forecastObject because it type is futureType is may be initialize or not
    /// and we use then that say when it initialize then print.
    forecastObject.then((value) => {
      print(value.city)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: ListView(
       children: [
         _textFiledView(),
         Container(
           /// We can pass "FutureBuilder<WeatherForecastModel>"
           child: FutureBuilder(
             future: forecastObject,
             builder: (context, AsyncSnapshot<WeatherForecastModel> snapshot) {
               if(snapshot.hasData){
                 return Column(
                   children: [
                     MidView(snapshot: snapshot),
                     BottomView(snapshot: snapshot),
                   ],
                 );
               }else{
                 return Container(
                   alignment: Alignment.center,
                   child: CircularProgressIndicator(),
                 );
               }
             },
           ),
         )
       ],
     ),
    );
  }

  Widget _textFiledView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            contentPadding: EdgeInsets.all(8.0)
          ),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = getWeather(_cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather(String cityName) => Network().getWeatherForecast(cityName: _cityName);

}

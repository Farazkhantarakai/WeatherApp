import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/api/api.dart';
import 'package:weather_app/model/weather.dart';

class GlobalController extends GetxController {
  //create variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  ApiService apiService = Get.put(ApiService());
  //we are able to instantiate every class like this
  final data = weather().obs;
  RxBool getLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLangitude() => _longitude;

  getWeatherData() {
    return data.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }

    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    //checking the service is enabled or not
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error('Location Service not enabled');
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('location permission denied forever');
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('location permission denied');
      }
    }
    //getting the current position
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      //update the position here
      _longitude.value = position.longitude;
      _latitude.value = position.latitude;

      apiService.getWeather(_latitude.value, _longitude.value).then((value) {
        data.value = value;
        _isLoading.value = false;
      });
    });
  }
}

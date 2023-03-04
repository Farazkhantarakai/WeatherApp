import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as intl;

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String? city = "";
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  String date = intl.DateFormat('yMMMMd').format(DateTime.now());
  @override
  void initState() {
    getAddress(globalController.getLatitude().value,
        globalController.getLangitude().value);
    super.initState();
  }

  getAddress(lat, long) async {
    var placemark =
        await GeocodingPlatform.instance.placemarkFromCoordinates(lat, long);

    Placemark place = placemark[2];
    setState(() {
      city = place.street;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            city!,
            style: const TextStyle(
                fontSize: 20,
                height: 1.5,
                color: Colors.black,
                wordSpacing: 3,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Text(
            date,
            style: const TextStyle(
                fontSize: 17,
                height: 1.5,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

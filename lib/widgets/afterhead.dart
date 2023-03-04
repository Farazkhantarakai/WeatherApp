import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather.dart';

class AfterHeaderWidget extends StatelessWidget {
  const AfterHeaderWidget({super.key, required this.data});
  final weather data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/${data.current!.weather![0].icon}.png',
              width: 80,
              height: 80,
            ),
            Container(
              width: 1,
              height: 50,
              decoration: const BoxDecoration(color: Colors.grey),
            ),
            RichText(
                text: TextSpan(
                    text: '${data.current!.temp}°',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 58,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text: '${data.current!.weather![0].main}',
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15))
                ])),
          ],
        ),

        const SizedBox(
          height: 20,
        ),

// humidity rain and  windspeed will be gotten here
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 7),
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Image.asset(
                    'assets/windspeed.png',
                  ),
                ),
                Text(
                  '${data.current!.windSpeed}km/hr',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 7),
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Image.asset(
                    'assets/clouds.png',
                  ),
                ),
                Text(
                  '${data.current!.clouds}%',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 7),
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Image.asset(
                    'assets/humidity.png',
                  ),
                ),
                Text(
                  '${data.current!.humidity}%',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

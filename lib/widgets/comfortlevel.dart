import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/model/weather.dart';

class ComfortLevel extends StatelessWidget {
  ComfortLevel({super.key, required this.data});
  weather? data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          const Text(
            'Comfort Level',
            style: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          SleekCircularSlider(
            min: 0,
            max: 100,
            initialValue: double.parse(data!.current!.humidity.toString()),
            appearance: CircularSliderAppearance(
                customWidths:
                    CustomSliderWidths(handlerSize: 0, trackWidth: 12),
                infoProperties: InfoProperties(
                    bottomLabelText: "Humidity",
                    bottomLabelStyle: const TextStyle(
                        fontSize: 14, letterSpacing: 0.1, height: 1.5)),
                customColors: CustomSliderColors(
                    hideShadow: true,
                    dotColor: Colors.blue,
                    trackColor: Colors.blue.withAlpha(100),
                    progressBarColors: [Colors.blue, Colors.blue.shade400])),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Feels Like ${data!.current!.feelsLike}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                'UV Index ${data!.current!.uvi}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

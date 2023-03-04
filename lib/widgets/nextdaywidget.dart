import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather.dart';

class NextDayWidget extends StatelessWidget {
  NextDayWidget({super.key, required this.data});

  weather data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      height: 330,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Next Days',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: data.daily!.length > 7 ? 5 : data.daily!.length,
                itemBuilder: (context, index) {
                  final days = DateTime.fromMillisecondsSinceEpoch(
                      data.daily![index + 1].dt!.toInt() * 1000);
                  final day = DateFormat('EEE').format(days);
                  return Container(
                    height: 50,
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              day,
                              style: const TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Image.asset(
                              'assets/${data.daily![index + 1].weather![0].icon}.png',
                              width: 35,
                            ),
                            Text(
                              '${data.daily![index + 1].temp!.max}°/${data.daily![index].temp!.min}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          decoration: const BoxDecoration(color: Colors.grey),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

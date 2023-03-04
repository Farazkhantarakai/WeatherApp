import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather.dart';

class TodayWidget extends StatefulWidget {
  TodayWidget({super.key, required this.data});
  weather data;

  @override
  State<TodayWidget> createState() => _TodayWidgetState();
}

class _TodayWidgetState extends State<TodayWidget> {
  var selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),

      height: 200,
      // decoration: BoxDecoration(color: Colors.blue.shade300),
      child: Column(
        children: [
          const Text(
            'Today',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    DateTime time = DateTime.fromMillisecondsSinceEpoch(
                        widget.data.hourly![index].dt!.toInt() * 1000);
                    // print(time);
                    var t = DateFormat('jm').format(time);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = index;
                          // print(selected);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10, top: 5),
                        padding: const EdgeInsets.all(20),
                        width: 100,
                        height: 160,
                        decoration: BoxDecoration(
                            color: selected == index
                                ? Colors.blue
                                : Colors.grey.shade200,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              t,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: selected == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Image.asset(
                              'assets/${widget.data.hourly![index].weather![0].icon}.png',
                              width: 60,
                              height: 60,
                            ),
                            const Spacer(),
                            Text(
                              '${widget.data.hourly![index].temp}°',
                              style: TextStyle(
                                  color: selected == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weather_app/widgets/afterhead.dart';
import 'package:weather_app/widgets/comfortlevel.dart';
import 'package:weather_app/widgets/nextdaywidget.dart';
import '../widgets/header_widget.dart';
import '../widgets/today.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  // final ApiService apiController = Get.put(ApiService(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        // globalController.makeIsLoadingFalse();
        await globalController.getLocation();
      },
      child: SafeArea(
          child: Obx(
        () => globalController.getLoading().isTrue
            ? Center(
                child: Image.asset(
                  'assets/clouds.png',
                  width: 60,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  // scrollDirection: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    // Header Section
                    const HeaderWidget(),
                    // be remember how to get data like this
                    AfterHeaderWidget(
                      data: globalController.getWeatherData(),
                    ),
                    //it will view today listview
                    TodayWidget(
                      data: globalController.getWeatherData(),
                    ),
                    //NextDays
                    NextDayWidget(data: globalController.getWeatherData()),
                    const Divider(
                      thickness: 1,
                    ),
                    ComfortLevel(data: globalController.getWeatherData())
                  ],
                ),
              ),
      )),
    ));
  }
}

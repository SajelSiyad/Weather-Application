import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather/provider/api_provider/api_provider.dart';
import 'package:weather/provider/api_provider/provider.dart';
import 'package:weather/utils/responsive.dart';

class Home extends ConsumerWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Icon cusicon = Icon(
      Icons.search,
      size: R.width(28, context),
    );
    /*  */
    // log("${DateFormat("yyyy-MM-dd").format(DateTime.now())}");
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: ref.watch(getCurrentWeatherDatasProvider).when(
                  data: (data) {
                    Widget custitle = Column(
                      children: [
                        Text(
                          data!.location.name,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${data.location.region}, ",
                              style: TextStyle(
                                  fontSize: R.width(15, context),
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              data.location.country,
                              style: TextStyle(
                                  fontSize: R.width(15, context),
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    );

                    return Padding(
                      padding: EdgeInsets.only(right: R.width(10, context)),
                      child: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          leading: SizedBox(
                            width: R.width(20, context),
                          ),
                          actions: [
                            IconButton(onPressed: () {}, icon: cusicon)
                          ],
                          centerTitle: true,
                          title: custitle),
                    );
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                )),
        body: ref.watch(getCurrentWeatherDatasProvider).when(
          data: (data) {
            return SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 139, 166, 188),
                  Color.fromARGB(255, 61, 150, 223),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: R.width(15, context),
                      right: R.width(15, context),
                      top: R.width(40, context)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: R.width(20, context),
                      )
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {},
                      //       icon: const Icon(Icons.add),
                      //       iconSize: R.width(30, context),
                      //       color: Colors.white,
                      //     ),
                      //     Column(
                      //       children: [
                      //         Text(
                      //           data!.location.name,
                      //           style: TextStyle(
                      //               fontSize: R.width(20, context),
                      //               color: Colors.white),
                      //         ),
                      //         Row(
                      //           children: [
                      //             Text(
                      //               data.location.region,
                      //               style: const TextStyle(color: Colors.white),
                      //             ),
                      //             Text(
                      //               data.location.country,
                      //               style: const TextStyle(color: Colors.white),
                      //             )
                      //           ],
                      //         )
                      //       ],
                      //     ),
                      //     IconButton(
                      //       onPressed: () {},
                      //       icon: const Icon(Icons.more_vert),
                      //       iconSize: R.width(25, context),
                      //       color: Colors.white,
                      //     )
                      //   ],
                      // ),
                      ,
                      SizedBox(
                        height: R.width(30, context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: R.width(100, context),
                            width: R.width(100, context),
                            child: Image(
                              image: NetworkImage(
                                  "https:${data!.current.condition.icon}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Wind: ${data.current.windKph}km/h",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: R.width(17, context)),
                              ),
                              Text(
                                "Precip :${data.current.precipIn}In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: R.width(17, context)),
                              ),
                              Text(
                                "Cloud: ${data.current.cloud}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: R.width(17, context)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: R.width(50, context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${data.current.tempC.toInt()}ºC",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: R.width(80, context),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Text(
                        "${data.current.tempF}ºf",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: R.width(25, context)),
                      ),
                      SizedBox(
                        height: R.width(5, context),
                      ),
                      Text(
                        data.current.condition.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: R.width(18, context),
                        ),
                      ),
                      SizedBox(
                        height: R.width(10, context),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: R.width(10, context),
                            vertical: R.width(2, context)),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(65, 255, 255, 255),
                            borderRadius:
                                BorderRadius.circular(R.width(10, context))),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.air,
                              color: Color.fromARGB(191, 255, 255, 255),
                            ),
                            Text(
                              "AQI ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: R.width(12, context)),
                            ),
                            Text(
                              data.current.airQuality.pm25.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: R.width(12, context)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: R.width(30, context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < 4; i++)
                            ref
                                .watch(getWeatherDatasProvider(
                                    DateFormat("yyyy-MM-dd").format(
                                        DateTime.now()
                                            .add(Duration(days: i + 1)))))
                                .when(
                                  data: (data) {
                                    if (data == null) {
                                      return Column(
                                        children: [
                                          Text(
                                            DateFormat("EEE").format(
                                                DateTime.now().add(
                                                    Duration(days: i + 1))),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: R.width(18, context)),
                                          ),
                                          const Icon(Icons.error)
                                          // Image.network(
                                          //     "https:${data!.forecast.forecastday[0].day.condition.icon}"),
                                          // Text(
                                          //   "${data.forecast.forecastday[0].hour[0].tempF}ºf",
                                          //   style: TextStyle(
                                          //       color: Colors.white,
                                          //       fontSize: R.width(18, context)),
                                          // )
                                        ],
                                      );
                                    }
                                    return Column(
                                      children: [
                                        Text(
                                          DateFormat("EEE").format(
                                              DateTime.now()
                                                  .add(Duration(days: i + 1))),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: R.width(18, context)),
                                        ),
                                        Image.network(
                                            "https:${data!.forecast.forecastday[0].day.condition.icon}"),
                                        Text(
                                          "${data.forecast.forecastday[0].hour[0].tempF}ºf",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: R.width(18, context)),
                                        )
                                      ],
                                    );
                                  },
                                  error: (error, stackTrace) => Center(
                                    child: Text(error.toString()),
                                  ),
                                  loading: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )

                          // Column(
                          //   children: [
                          //     Text(
                          //       "Wed",
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: R.width(18, context)),
                          //     ),
                          //     Image.network(
                          //         "https://cdn.weatherapi.com/weather/64x64/day/116.png"),
                          //     Text(
                          //       "84.4ºf",
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: R.width(18, context)),
                          //     ),
                          //   ],
                          // ),
                          // Column(
                          //   children: [
                          //     Text(
                          //       "Wed",
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: R.width(18, context)),
                          //     ),
                          //     Image.network(
                          //         "https://cdn.weatherapi.com/weather/64x64/day/113.png"),
                          //     Text(
                          //       "84.4ºf",
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: R.width(18, context)),
                          //     )
                          //   ],
                          // ),
                          // Column(
                          //   children: [
                          //     Text(
                          //       "Wed",
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: R.width(18, context)),
                          //     ),
                          //     Image.network(
                          //         "https://cdn.weatherapi.com/weather/64x64/day/116.png"),
                          //     Text(
                          //       "84.4ºf",
                          //       style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: R.width(18, context)),
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: R.width(20, context),
                      ),
                      ref
                          .watch(getWeatherDatasProvider(
                              DateFormat("yyyy-MM-dd").format(DateTime.now())))
                          .when(
                        data: (data) {
                          return Container(
                            // height: R.width(200, context),
                            // width: MediaQuery.sizeOf(context).width,
                            padding: EdgeInsets.symmetric(
                                horizontal: R.width(20, context),
                                vertical: R.width(20, context)),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(
                                R.width(15, context),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/sunrise.png",
                                          scale: 8,
                                        ),
                                        Text(
                                          "Sunrise ${data!.forecast.forecastday[0].astro.sunrise}",
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  219, 255, 255, 255)),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/sunset.png",
                                          scale: 8,
                                        ),
                                        Text(
                                          "Sunset ${data.forecast.forecastday[0].astro.sunset}",
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  219, 255, 255, 255)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: R.width(20, context),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Real feel",
                                          style: TextStyle(
                                              color: Colors.white60,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: R.width(5, context),
                                        ),
                                        Text(
                                          "${data.forecast.forecastday[0].hour[0].feelslikeC}ºC",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: R.width(17, context),
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: R.width(10, context),
                                        ),
                                        const Text(
                                          "Chance of rain",
                                          style: TextStyle(
                                              color: Colors.white60,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: R.width(5, context),
                                        ),
                                        Text(
                                          "${data.forecast.forecastday[0].hour[0].chanceOfRain}%",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: R.width(17, context),
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: R.width(10, context),
                                        ),
                                        const Text(
                                          "Wind speed",
                                          style: TextStyle(
                                              color: Colors.white60,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: R.width(5, context),
                                        ),
                                        Text(
                                          "${data.forecast.forecastday[0].hour[0].windKph}km/h",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: R.width(17, context),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Humidity",
                                          style: TextStyle(
                                              color: Colors.white60,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: R.width(5, context),
                                        ),
                                        Text(
                                          "${data.forecast.forecastday[0].hour[0].humidity}%",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: R.width(17, context),
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: R.width(10, context),
                                        ),
                                        const Text(
                                          "Chance of rain",
                                          style: TextStyle(
                                              color: Colors.white60,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: R.width(5, context),
                                        ),
                                        Text(
                                          "${data.forecast.forecastday[0].hour[0].pressureMb}mbar",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: R.width(17, context),
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: R.width(10, context),
                                        ),
                                        const Text(
                                          "UV index",
                                          style: TextStyle(
                                              color: Colors.white60,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: R.width(5, context),
                                        ),
                                        Text(
                                          "${data.forecast.forecastday[0].hour[0].uv.toInt()}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: R.width(17, context),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        error: (error, stackTrace) {
                          return const Icon(Icons.error);
                        },
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      SizedBox(
                        height: R.width(20, context),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            return const Icon(Icons.error);
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}

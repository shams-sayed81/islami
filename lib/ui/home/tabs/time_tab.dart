import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:islamic13/style/colors_manager.dart';
import 'package:islamic13/style/strings_manager.dart';
import 'package:islamic13/ui/home/widgets/azkar_item.dart';

import '../../../style/assets_manager.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  late PrayerTimes prayerTimes;
  late Prayer? nextPrayer;
  late Map<Prayer, DateTime> allPrayerTimes = {};
  Duration? timeRemaining;
  Timer? countdownTimer;
  DateTime? nextPrayerTime;

  @override
  void initState() {
    super.initState();
    calculatePrayerTimes();
  }

  void calculatePrayerTimes() {
    final coordinates = Coordinates(30.0444, 31.2357); // Cairo
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.hanafi;

    final date = DateComponents.from(DateTime.now());
    prayerTimes = PrayerTimes(coordinates, date, params);

    allPrayerTimes = {
      Prayer.fajr: prayerTimes.fajr,
      Prayer.sunrise: prayerTimes.sunrise,
      Prayer.dhuhr: prayerTimes.dhuhr,
      Prayer.asr: prayerTimes.asr,
      Prayer.maghrib: prayerTimes.maghrib,
      Prayer.isha: prayerTimes.isha,
    };

    nextPrayer = prayerTimes.nextPrayer();

    if (nextPrayer != null) {
      nextPrayerTime = allPrayerTimes[nextPrayer!]!;
    } else {
      final tomorrow = DateTime.now().add(const Duration(days: 1));
      final nextDay = DateComponents.from(tomorrow);
      final nextDayPrayerTimes = PrayerTimes(coordinates, nextDay, params);

      nextPrayer = Prayer.fajr;
      nextPrayerTime = nextDayPrayerTimes.fajr;
    }

    updateCountdown();
    setState(() {});
  }

  void updateCountdown() {
    countdownTimer?.cancel();

    if (nextPrayerTime != null) {
      countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        final now = DateTime.now();
        final remaining = nextPrayerTime!.difference(now);

        if (remaining.isNegative) {
          countdownTimer?.cancel();
          calculatePrayerTimes();
        } else {
          setState(() {
            timeRemaining = remaining;
          });
        }
      });
    }
  }

  String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetsManager.timeBack),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(AssetsManager.logo)),
                  const SizedBox(height: 30),
                  if (allPrayerTimes.isNotEmpty)
                    Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      decoration: BoxDecoration(
                          color: const Color(0xff856B3F),
                          borderRadius: BorderRadius.circular(40),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/Group 35.png'),
                              fit: BoxFit.fill)),
                      child: Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 120,
                              enableInfiniteScroll: false,
                              enlargeCenterPage: true,
                              viewportFraction: 0.3,
                            ),
                            items: allPrayerTimes.entries.map((entry) {
                              final name = entry.key.name.toUpperCase();
                              final time = entry.value;
                              final isNext = entry.key == nextPrayer;

                              final formattedTime = TimeOfDay.fromDateTime(time).format(context);
                              final parts = formattedTime.split(' ');
                              final clock = parts[0];
                              final period = parts.length > 1 ? parts[1] : '';

                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    decoration: BoxDecoration(
                                      color: isNext ? Colors.black87 : Colors.white.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(20),

                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          name,
                                          style: TextStyle(
                                            color: isNext ? ColorsManager.primary : Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          clock,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: isNext ? ColorsManager.primary : Colors.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          period,
                                          style: TextStyle(
                                            color: isNext ? ColorsManager.primary : Colors.black54,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );

                                },
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          if (nextPrayerTime != null && timeRemaining != null)
                            Text(
                              'Next Prayer – ${formatDuration(timeRemaining!)}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Azkar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: const AzkarItem(
                            asset: AssetsManager.evening,
                            azkar: StringsManager.evening,
                          ),
                          onTap: () {},
                        ),
                        InkWell(
                          child: const AzkarItem(
                              asset: AssetsManager.morning,
                              azkar: StringsManager.morning),
                          onTap: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

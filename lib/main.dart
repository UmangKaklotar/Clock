
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main()
{
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Clock(),
    ),
  );
}

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  DateTime liveTime = DateTime.now();
  int selectPage = 1;

  // World Clock
  String india = "00:00", meriDiem = "AM";

  // Alarm
  int setHH = 1, setMM = 0, snooze = 1;
  String setMeriDiem = "AM";

  // Stop Watch
  int timerHour = 0, timerMinute = 0, timerSecond = 0, stopWatch = 0;
  String ss = "00", mm = "00", hh = "00";
  late Timer t1;

  // Timer
  int timerHH = 0, timerMM = 0, timerSS = 0, view = 0, timerView = 0;
  String timer = "00:00:00", alarmRing = "Radar";
  late Timer t2;

  // Alarm List
  List<Map<String,dynamic>> setAlarm = [];

  @override
  void initState() {
    // TODO: implement initState
    india = indiaTime().toString();
    if(liveTime.hour >= 12)
    {
      meriDiem = "PM";
    }
  }

  @override
  Widget build(BuildContext context) {
    double H = MediaQuery.of(context).size.height;
    double W = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(selectPage == 1)
              Container(
                height: 740,
                width: W,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      height: 50,
                      width: W,
                      //color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Edit",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xffFF9F0A),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (context){
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          elevation: 1,
                                          child: Container(
                                            height: 225,
                                            width: 230,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff222222),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    decoration: const BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: const Color(0xff454545),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text("India",
                                                      style: TextStyle(
                                                        fontFamily: 'Iphone',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    decoration: const BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: const Color(0xff454545),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text("Dubai",
                                                      style: TextStyle(
                                                        fontFamily: 'Iphone',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    decoration: const BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: const Color(0xff454545),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text("America",
                                                      style: TextStyle(
                                                        fontFamily: 'Iphone',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    decoration: const BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: const Color(0xff454545),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text("London",
                                                      style: TextStyle(
                                                        fontFamily: 'Iphone',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    alignment: Alignment.center,
                                                    child: const Text("Paris",
                                                      style: TextStyle(
                                                        fontFamily: 'Iphone',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                  );
                                });
                              },
                              child: const Icon(Icons.add, size: 30, color: Color(0xffFF9F0A))),
                        ],
                      ),
                    ),
                    const Text("World Clock",
                      style: TextStyle(
                        fontFamily: 'Iphone',
                        color: Colors.white,
                        fontSize: 40,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 2,
                      width: W,
                      color: const Color(0xff1D1D1F),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: W,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xff1D1D1F),
                                width: 2,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text("Today, +0HRS",
                                    style: TextStyle(
                                      fontFamily: 'Iphone',
                                      color: Color(0xff8A8A8F),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text("New Delhi",
                                    style: TextStyle(
                                      fontFamily: 'Iphone',
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text(india,
                                    style: const TextStyle(
                                      fontFamily: 'Iphone',
                                      fontSize: 65,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Align(
                                    alignment: const Alignment(0,0.4),
                                    child: Text(meriDiem,
                                      style: const TextStyle(
                                        fontFamily: 'Iphone',
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            if(selectPage == 2)
              Container(
                height: 740,
                width: W,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      height: 50,
                      width: W,
                      //color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Edit",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xffFF9F0A),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                              onTap: (){
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (context){
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          elevation: 3,
                                          child: Container(
                                            height: 500,
                                            width: W,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff1C1C1E),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 40, right: 50),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: ListWheelScrollView.useDelegate(
                                                            onSelectedItemChanged: (e) {
                                                              setHH = e+1;
                                                              print("Hour : ${e + 1}");
                                                              print(setHH);
                                                            },
                                                            itemExtent: 35,
                                                            perspective: 0.0010,
                                                            diameterRatio: 0.8,
                                                            physics: const FixedExtentScrollPhysics(),
                                                            childDelegate: ListWheelChildBuilderDelegate(
                                                              childCount: 12,
                                                              builder: (context, index){
                                                                return Text("${index + 1}",
                                                                  style: const TextStyle(
                                                                    fontSize: 30,
                                                                    fontFamily: 'Iphone',
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: ListWheelScrollView.useDelegate(
                                                            onSelectedItemChanged: (e) {
                                                              setMM = e;
                                                              print("Minute : $e");
                                                              print(setMM);
                                                            },
                                                            itemExtent: 35,
                                                            perspective: 0.0010,
                                                            diameterRatio: 0.8,
                                                            physics: const FixedExtentScrollPhysics(),
                                                            childDelegate: ListWheelChildBuilderDelegate(
                                                              childCount: 60,
                                                              builder: (context, index){
                                                                return Text("$index",
                                                                  style: const TextStyle(
                                                                    fontSize: 30,
                                                                    fontFamily: 'Iphone',
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: ListWheelScrollView.useDelegate(
                                                            onSelectedItemChanged: (e) {
                                                              setMeriDiem = (e == 0) ? "AM" : "PM";
                                                              print("Meridiem : $e");
                                                              print(setMeriDiem);
                                                            },
                                                            itemExtent: 35,
                                                            perspective: 0.0010,
                                                            diameterRatio: 0.8,
                                                            physics: const FixedExtentScrollPhysics(),
                                                            childDelegate: ListWheelChildBuilderDelegate(
                                                              childCount: 2,
                                                              builder: (context, index){
                                                                return Text(
                                                                  index == 0 ? "AM" : "PM",
                                                                  style: const TextStyle(
                                                                    fontSize: 30,
                                                                    fontFamily: 'Iphone',
                                                                    color: Colors.white,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(10),
                                                        child: Container(
                                                          height: 180,
                                                          decoration: BoxDecoration(
                                                            color: const Color(0xff2C2C2E),
                                                            borderRadius: BorderRadius.circular(15),
                                                          ),
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 20),
                                                                child: Container(
                                                                  height: 45,
                                                                  width: W,
                                                                  decoration: const BoxDecoration(
                                                                    border: Border(
                                                                      bottom: BorderSide(
                                                                        color: Color(0xff454545),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  alignment: Alignment.center,
                                                                  child: Row(
                                                                    children: const [
                                                                      Text("Repeat",
                                                                        style: TextStyle(
                                                                          fontFamily: 'Iphone',
                                                                          fontSize: 20,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                      Spacer(),
                                                                      Text("Never",
                                                                        style: TextStyle(
                                                                          fontFamily: 'Iphone',
                                                                          fontSize: 20,
                                                                          color: Color(0xff96969C),
                                                                          fontWeight: FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 10),
                                                                      Icon(Icons.arrow_forward_ios_rounded,
                                                                        size: 20,
                                                                        color: Color(0xff96969C),
                                                                      ),
                                                                      SizedBox(width: 10),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 20),
                                                                child: Container(
                                                                  height: 45,
                                                                  width: W,
                                                                  decoration: const BoxDecoration(
                                                                    border: Border(
                                                                      bottom: BorderSide(
                                                                        color: Color(0xff454545),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  alignment: Alignment.center,
                                                                  child: Row(
                                                                    children: const [
                                                                      Text("Label",
                                                                        style: TextStyle(
                                                                          fontFamily: 'Iphone',
                                                                          fontSize: 20,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                      Spacer(),
                                                                      Text("Alarm",
                                                                        style: TextStyle(
                                                                          fontFamily: 'Iphone',
                                                                          fontSize: 20,
                                                                          color: Color(0xff96969C),
                                                                          fontWeight: FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 10),
                                                                      Icon(Icons.arrow_forward_ios_rounded,
                                                                        size: 20,
                                                                        color: Color(0xff96969C),
                                                                      ),
                                                                      SizedBox(width: 10),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 20),
                                                                child: Container(
                                                                  height: 45,
                                                                  width: W,
                                                                  decoration: const BoxDecoration(
                                                                    border: Border(
                                                                      bottom: BorderSide(
                                                                        color: Color(0xff454545),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  alignment: Alignment.center,
                                                                  child: Row(
                                                                    children: const [
                                                                      Text("Sound",
                                                                        style: TextStyle(
                                                                          fontFamily: 'Iphone',
                                                                          fontSize: 20,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                      Spacer(),
                                                                      Text("Opening",
                                                                        style: TextStyle(
                                                                          fontFamily: 'Iphone',
                                                                          fontSize: 20,
                                                                          color: Color(0xff96969C),
                                                                          fontWeight: FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                      SizedBox(width: 10),
                                                                      Icon(Icons.arrow_forward_ios_rounded,
                                                                        size: 20,
                                                                        color: Color(0xff96969C),
                                                                      ),
                                                                      SizedBox(width: 10),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 20),
                                                                child: Container(
                                                                  height: 45,
                                                                  width: W,
                                                                  alignment: Alignment.center,
                                                                  child: Row(
                                                                    children: [
                                                                      const Text("Snooze",
                                                                        style: TextStyle(
                                                                          fontFamily: 'Iphone',
                                                                          fontSize: 20,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                      const Spacer(),
                                                                      GestureDetector(
                                                                        onTap: (){
                                                                          setState(() {
                                                                            snooze++;
                                                                            print(snooze);
                                                                          });
                                                                        },
                                                                        child: Container(
                                                                          height: 35,
                                                                          width: 65,
                                                                          decoration: BoxDecoration(
                                                                            color: (snooze % 2 == 1) ? const Color(0xff30D158) : const Color(0xff262629),
                                                                            borderRadius: BorderRadius.circular(20),
                                                                          ),
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(2),
                                                                            child: Row(
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: (snooze % 2 == 1) ? const Color(0xff30D158) : const Color(0xffFFFFFF),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: (snooze % 2 == 1) ? const Color(0xffFFFFFF) : const Color(0xff262629),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(width: 10),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: (){
                                                          setState(() {
                                                            Navigator.pop(context);
                                                            setAlarm.add({
                                                              'time': "$setHH:$setMM",
                                                              'meriDiem': setMeriDiem,
                                                              'onOff': 1,
                                                            });
                                                            setHH = 1;
                                                            setMM = 0;
                                                            setMeriDiem = "AM";
                                                          });
                                                        },
                                                        child: const Text("Save",
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                            color: Color(0xffFF9F0A),
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                  );
                                });
                              },
                              child: const Icon(Icons.add, size: 30, color: Color(0xffFF9F0A))),
                        ],
                      ),
                    ),
                    const Text("Alarm",
                      style: TextStyle(
                        fontFamily: 'Iphone',
                        color: Colors.white,
                        fontSize: 40,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.airline_seat_flat_angled_rounded,
                          size: 25,
                          color: Colors.white,
                        ),
                        Text(" Sleep | Wake Up",
                          style: TextStyle(
                            fontFamily: 'Iphone',
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 70,
                      width: W,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Color(0xff1D1D1F),
                            width: 2,
                          ),
                          bottom: BorderSide(
                            color: Color(0xff1D1D1F),
                            width: 2,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text("No Alarm",
                            style: TextStyle(
                              fontFamily: 'Iphone',
                              color: Color(0xff96969C),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 35,
                            width: 90,
                            decoration: BoxDecoration(
                              color: const Color(0xff262629),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            alignment: Alignment.center,
                            child: const Text("SET UP",
                              style: TextStyle(
                                color: Color(0xffFF9F0A),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Other",
                      style: TextStyle(
                        fontFamily: 'Iphone',
                        color: Colors.white,
                        fontSize: 25,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 2,
                      width: W,
                      color: const Color(0xff1D1D1F),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: setAlarm.map((e) {
                            return Container(
                              height: 100,
                              width: W,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff1D1D1F),
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(e['time'],
                                            style: TextStyle(
                                              fontFamily: 'Iphone',
                                              fontSize: 60,
                                              color: (e['onOff'] % 2 == 1) ? const Color(0xffFFFFFF) : const Color(0xff96969C),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(e['meriDiem'],
                                            style: TextStyle(
                                              fontFamily: 'Iphone',
                                              fontSize: 25,
                                              color: (e['onOff'] % 2 == 1) ? const Color(0xffFFFFFF) : const Color(0xff96969C),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text("Alarm",
                                        style: TextStyle(
                                          fontFamily: 'Iphone',
                                          color: (e['onOff'] % 2 == 1) ? const Color(0xffFFFFFF) : const Color(0xff96969C),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        e['onOff']++;
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 65,
                                      decoration: BoxDecoration(
                                        color: (e['onOff'] % 2 == 1) ? const Color(0xff30D158) : const Color(0xff262629),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: (e['onOff'] % 2 == 1) ? const Color(0xff30D158) : const Color(0xffFFFFFF),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: (e['onOff'] % 2 == 1) ? const Color(0xffFFFFFF) : const Color(0xff262629),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            if(selectPage == 3)
              Container(
                height: 740,
                width: W,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$hh:$mm:$ss",
                      style: const TextStyle(
                        fontFamily: 'Iphone',
                        fontSize: 85,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 150),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        (stopWatch == 0) ? GestureDetector(
                          onTap: (){
                            setState(() {
                              stopWatch = 1;
                              t1 = Timer.periodic(const Duration(seconds: 1), (e){
                                timerSecond++;
                                if(timerSecond > 59)
                                {
                                  timerSecond = 0;
                                  timerMinute++;
                                }
                                if(timerMinute > 59)
                                {
                                  timerMinute = 0;
                                  timerHour++;
                                }

                                if(timerSecond >= 0 && timerSecond < 10)
                                {
                                  ss = "0$timerSecond";
                                }
                                else
                                {
                                  ss = "$timerSecond";
                                }

                                if(timerMinute >= 0 && timerMinute < 10)
                                {
                                  mm = "0$timerMinute";
                                }
                                else
                                {
                                  mm = "$timerMinute";
                                }

                                if(timerHour >= 0 && timerHour < 10)
                                {
                                  hh = "0$timerHour";
                                }
                                else
                                {
                                  hh = "$timerHour";
                                }
                              });
                            });
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                              color: Color(0xff0A2A12),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                color: const Color(0xff0A2A12),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: const Text("Start",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  color: Color(0xff2CB24D),
                                  letterSpacing: 0.5,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                          ),
                        ) : GestureDetector(
                          onTap: (){
                            setState(() {
                              t1.cancel();
                              stopWatch = 0;
                            });
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                              color: Color(0xff330E0C),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                color: const Color(0xff330E0C),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: const Text("Stop",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  color: Colors.red,
                                  letterSpacing: 0.5,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              t1.cancel();
                              timerSecond = 0;
                              timerMinute = 0;
                              timerHour = 0;
                              hh = "00";
                              mm = "00";
                              ss = "00";
                              stopWatch = 0;
                            });
                          },
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                              color: Color(0xff333333),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                color: const Color(0xff333333),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: const Text("Reset",
                                style: TextStyle(
                                  fontFamily: 'Iphone',
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            if(selectPage == 4)
              Container(
                height: 740,
                width: W,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: (view == 0) ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex : 2,
                                    child: ListWheelScrollView.useDelegate(
                                      onSelectedItemChanged: (e) {
                                        timerHH = e;
                                        print("Hour : $e");
                                        print(timerHH);
                                      },
                                      itemExtent: 35,
                                      perspective: 0.005,
                                      diameterRatio: 0.8,
                                      physics: const FixedExtentScrollPhysics(),
                                      childDelegate: ListWheelChildBuilderDelegate(
                                        childCount: 24,
                                        builder: (context, index){
                                          return Text("$index",
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Iphone',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 3,
                                    child: Text("Hours",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Iphone',
                                        color: Colors.white,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListWheelScrollView.useDelegate(
                                      onSelectedItemChanged: (e) {
                                        timerMM = e;
                                        print("Minute : $e");
                                        print(timerMM);
                                      },
                                      itemExtent: 35,
                                      perspective: 0.005,
                                      diameterRatio: 0.8,
                                      physics: const FixedExtentScrollPhysics(),
                                      childDelegate: ListWheelChildBuilderDelegate(
                                        childCount: 60,
                                        builder: (context, index){
                                          return Text("$index",
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Iphone',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: Text("Min",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Iphone',
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ListWheelScrollView.useDelegate(
                                      onSelectedItemChanged: (e) {
                                        timerSS = e;
                                        print("Second : $e");
                                        print(timerSS);
                                      },
                                      itemExtent: 35,
                                      perspective: 0.005,
                                      diameterRatio: 0.8,
                                      physics: const FixedExtentScrollPhysics(),
                                      childDelegate: ListWheelChildBuilderDelegate(
                                        childCount: 60,
                                        builder: (context, index){
                                          return Text("$index",
                                            style: const TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Iphone',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: Text("Sec",
                                      style: TextStyle(
                                        fontSize: 24,
                                        letterSpacing: 1,
                                        fontFamily: 'Iphone',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ) : Center(
                        child: CircularPercentIndicator(
                          animation: (timerView == 0) ? false : true,
                          animationDuration: (((60 * timerHH) * 60) + ((timerMM) * 60) + (timerSS + 1)) * 1000,
                          radius: 150,
                          lineWidth: 10,
                          percent: 1,
                          progressColor: const Color(0xff262629),
                          backgroundColor: const Color(0xffFE9F0A),
                          circularStrokeCap: CircularStrokeCap.square,
                          reverse: true,
                          center: Text(timer,
                            style: const TextStyle(
                              fontFamily: 'Iphone',
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      t2.cancel();
                                      view = 0;
                                      timerView = 0;
                                      timerHH = 0;
                                      timerMM = 0;
                                      timerSS = 0;
                                      timer = "00:00:00";
                                      print("$timerHH:$timerMM:$timerSS");
                                      print(timer);
                                    });
                                  },
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff262629),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 85,
                                      width: 85,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff262629),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text("Cancel",
                                        style: TextStyle(
                                          fontFamily: 'Iphone',
                                          color: (view == 0) ? const Color(0xff96969C) : Colors.white,
                                          letterSpacing: 0.5,
                                          fontSize: 21,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                (timerView == 0 || view == 0)
                                    ? GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if(timerHH != 0 || timerMM != 0 || timerSS != 0)
                                      {
                                        timerView = 1;
                                        view = 1;
                                        t2 = Timer.periodic(const Duration(seconds: 1), (e) {
                                          timerSS--;
                                          if(timerSS < 0)
                                          {
                                            timerSS = 59;
                                            timerMM--;
                                          }
                                          if(timerMM < 0)
                                          {
                                            timerMM = 59;
                                            timerHH--;
                                          }
                                          timer = "$timerHH:$timerMM:$timerSS";
                                          if(timerHH == 0 && timerMM == 0 && timerSS == 0)
                                          {
                                            t2.cancel();
                                            view = 0;
                                          }
                                        });
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff0A2A12),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 85,
                                      width: 85,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff0A2A12),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text("Start",
                                        style: TextStyle(
                                          fontFamily: 'Iphone',
                                          color: Color(0xff2CB24D),
                                          letterSpacing: 0.5,
                                          fontSize: 21,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                    : GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      timerView = 0;
                                      t2.cancel();
                                    });
                                  },
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff332002),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 85,
                                      width: 85,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff332002),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: const Text("Pause",
                                        style: TextStyle(
                                          fontFamily: 'Iphone',
                                          color: Color(0xffEF9609),
                                          letterSpacing: 0.5,
                                          fontSize: 21,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (context){
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          elevation: 1,
                                          child: Container(
                                            height: 405,
                                            width: 230,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff222222),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                      alarmRing = "Radar";
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    decoration: const BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: Color(0xff454545),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text("Radar( Default )",
                                                      style: TextStyle(
                                                        fontFamily: 'Iphone',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                      alarmRing = "Apex";
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    decoration: const BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: Color(0xff454545),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text("Apex",
                                                      style: TextStyle(
                                                        fontFamily: 'Iphone',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                      alarmRing = "Beacon";
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    decoration: const BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: Color(0xff454545),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text("Beacon",
                                                      style: TextStyle(
                                                        fontFamily: 'Iphone',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                      alarmRing = "Cosmic";
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    decoration: const BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: Color(0xff454545),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text("Cosmic",
                                                      style: TextStyle(
                                                        fontFamily: 'Iphone',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                      alarmRing = "Presto";
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    decoration: const BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: Color(0xff454545),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text("Presto",
                                                      style: TextStyle(
                                                        fontFamily: 'Opening',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                      alarmRing = "Ripples";
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    decoration: const BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: Color(0xff454545),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text("Ripples",
                                                      style: TextStyle(
                                                        fontFamily: 'Opening',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                      alarmRing = "Slow Rise";
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    decoration: const BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: Color(0xff454545),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text("Slow Rise",
                                                      style: TextStyle(
                                                        fontFamily: 'Opening',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                      alarmRing = "Twinkle";
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    decoration: const BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: Color(0xff454545),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: const Text("Twinkle",
                                                      style: TextStyle(
                                                        fontFamily: 'Opening',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState(() {
                                                      Navigator.pop(context);
                                                      alarmRing = "Waves";
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 45,
                                                    width: W,
                                                    alignment: Alignment.center,
                                                    child: const Text("Waves",
                                                      style: TextStyle(
                                                        fontFamily: 'Opening',
                                                        fontSize: 23,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                  );
                                });
                              },
                              child: Container(
                                height: 60,
                                width: W,
                                decoration: BoxDecoration(
                                  color: const Color(0xff262629),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      const Text("When Timer Ends",
                                        style: TextStyle(
                                          fontFamily: 'Iphone',
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(alarmRing,
                                        style: const TextStyle(
                                          fontFamily: 'Iphone',
                                          fontSize: 22,
                                          color: Color(0xff96969C),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Icon(Icons.arrow_forward_ios_rounded,
                                        color: Color(0xff96969C),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


            Container(
              height: 60,
              width: W,
              // color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectPage = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.public_rounded,
                              size: 30,
                              color: selectPage == 1 ? const Color(0xffFF9F0A) : const Color(0xff757575)),
                          Text("World Clock",
                            style: TextStyle(
                              color: selectPage == 1 ? const Color(0xffFF9F0A) : const Color(0xff757575),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectPage = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.alarm,
                              size: 30,
                              color: selectPage == 2 ? const Color(0xffFF9F0A) : const Color(0xff757575)),
                          Text("Alarm",
                            style: TextStyle(
                              color: selectPage == 2 ? const Color(0xffFF9F0A) : const Color(0xff757575),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectPage = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.watch,
                              size: 30,
                              color: selectPage == 3 ? const Color(0xffFF9F0A) : const Color(0xff757575)),
                          Text("Stop Watch",
                            style: TextStyle(
                              color: selectPage == 3 ? const Color(0xffFF9F0A) : const Color(0xff757575),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectPage = 4;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.timer_outlined,
                              size: 30,
                              color: selectPage == 4 ? const Color(0xffFF9F0A) : const Color(0xff757575)),
                          Text("Timer",
                            style: TextStyle(
                              color: selectPage == 4 ? const Color(0xffFF9F0A) : const Color(0xff757575),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  indiaTime()
  {
    DateTime liveTime = DateTime.now();
    int h = liveTime.hour;
    int m = liveTime.minute;
    int s = liveTime.second;

    Timer.periodic(const Duration(seconds: 1), (e) {
      setState(() {
        s++;
        if(s > 59)
        {
          s = 0;
          m++;
        }
        if(m > 59)
        {
          m = 0;
          h++;
        }
        india = "$h:$m";
      });
    });
    return india;
  }
}

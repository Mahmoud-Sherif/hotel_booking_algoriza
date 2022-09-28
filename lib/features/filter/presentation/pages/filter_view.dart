import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';

class FiltterScreen extends StatefulWidget {
  const FiltterScreen({super.key});

  @override
  State<FiltterScreen> createState() => _FiltterScreenState();
}

class _FiltterScreenState extends State<FiltterScreen> {
  RangeValues values = const RangeValues(100, 800);

  double price = 100.0;
  bool myValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Filtter',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Price (for 1 night)',
                  style: TextStyle(fontSize: 18, color: ColorManager.lightGrey),
                ),
                const SizedBox(height: 15),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 12),
                      child: Text(
                        '\$100',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Spacer(),

                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 100),
                      child: Text(
                        '\$58',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    //range slider
                  ],
                ),
                RangeSlider(
                  values: values,
                  max: 1200,
                  min: 50,
                  labels: RangeLabels(values.start.round().toString(),
                      values.end.round().toString()),
                  onChanged: (value) {
                    setState(() {
                      values = value;
                    });
                  },
                  activeColor: ColorManager.primary,
                  inactiveColor: ColorManager.grey,
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Populer Filter',
                  style: TextStyle(
                    color: ColorManager.lightGrey,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        checkColor: ColorManager.backGround,
                        fillColor:
                            MaterialStateProperty.all(ColorManager.primary),
                        activeColor: ColorManager.error,
                        value: myValue,
                        onChanged: (value) {
                          setState(() {
                            myValue = value!;
                          });
                        }),
                    const Text(
                      'Free Breakfast',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Checkbox(
                              checkColor: ColorManager.backGround,
                              fillColor: MaterialStateProperty.all(
                                  ColorManager.primary),
                              activeColor: ColorManager.error,
                              value: myValue,
                              onChanged: (value) {
                                setState(() {
                                  myValue = value!;
                                });
                              }),
                        ),
                        const Text(
                          'Free Parking',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                        checkColor: ColorManager.backGround,
                        fillColor:
                            MaterialStateProperty.all(ColorManager.primary),
                        activeColor: ColorManager.error,
                        value: myValue,
                        onChanged: (value) {
                          setState(() {
                            myValue = value!;
                          });
                        }),
                    const Text(
                      'Pool',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Checkbox(
                            checkColor: ColorManager.backGround,
                            fillColor:
                                MaterialStateProperty.all(ColorManager.primary),
                            activeColor: ColorManager.error,
                            value: myValue,
                            onChanged: (value) {
                              setState(() {
                                myValue = value!;
                              });
                            }),
                        const Text(
                          'Pet Friendlly',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                        checkColor: ColorManager.backGround,
                        fillColor:
                            MaterialStateProperty.all(ColorManager.primary),
                        activeColor: ColorManager.error,
                        value: myValue,
                        onChanged: (value) {
                          setState(() {
                            myValue = value!;
                          });
                        }),
                    const Text(
                      'Free Wifi',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Distance from city center',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'Less than 5.0 km',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Slider(
                    activeColor: ColorManager.primary,
                    inactiveColor: ColorManager.grey,
                    value: price,
                    max: 220,
                    min: 80,
                    onChanged: (value) {
                      setState(() {
                        price = value;
                      });
                    }),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Type of accommodation',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Text(
                      'All',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 250),
                    Expanded(
                        child: Switch(
                      activeColor: ColorManager.primary,
                      inactiveTrackColor: ColorManager.grey,
                      value: myValue,
                      onChanged: (bool value) {},
                    ))
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 0.5,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    const Text(
                      'Apartment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 200,
                    ),
                    Expanded(
                        child: Switch(
                      activeColor: ColorManager.primary,
                      inactiveTrackColor: ColorManager.grey,
                      value: myValue,
                      onChanged: (bool value) {},
                    ))
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 240),
                    Expanded(
                        child: Switch(
                      activeColor: ColorManager.primary,
                      inactiveTrackColor: ColorManager.grey,
                      value: myValue,
                      onChanged: (bool value) {},
                    ))
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Villa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 250),
                    Expanded(
                        child: Switch(
                      activeColor: ColorManager.primary,
                      inactiveTrackColor: ColorManager.grey,
                      value: myValue,
                      onChanged: (bool value) {},
                    ))
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: ColorManager.white,
                  backgroundColor: ColorManager.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text("Apply"),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

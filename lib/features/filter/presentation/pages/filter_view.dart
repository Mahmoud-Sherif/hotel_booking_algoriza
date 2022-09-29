import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/config/routes/magic_router.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';
import 'package:hotel_booking_algoriza/features/filter/presentation/pages/search_view.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../injection_container.dart';
import '../cubit/search_cubit.dart';
import 'filter_result_view.dart';

class FiltterScreen extends StatefulWidget {
  const FiltterScreen({super.key});

  @override
  State<FiltterScreen> createState() => _FiltterScreenState();
}

class _FiltterScreenState extends State<FiltterScreen> {
  RangeValues values = const RangeValues(20, 200);

  double price = 100.0;
  bool myValue = false;
  bool isAC = false;
  bool isSeaView = false;
  bool isKitchen = false;
  bool isWifi = false;
  bool isGarden = false;
  bool isParking = false;
  int parkingID = 5;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(apiConsumer: sl<ApiConsumer>()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              MagicRouter.pop();
            },
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
                    style:
                        TextStyle(fontSize: 18, color: ColorManager.lightGrey),
                  ),
                  const SizedBox(height: 15),
                  // Row(
                  //   children: const [
                  //     Padding(
                  //       padding: EdgeInsetsDirectional.only(start: 12),
                  //       child: Text(
                  //         '\$100',
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //         ),
                  //       ),
                  //     ),
                  //     Spacer(),

                  //     Padding(
                  //       padding: EdgeInsetsDirectional.only(end: 100),
                  //       child: Text(
                  //         '\$58',
                  //         style: TextStyle(
                  //           fontSize: 18,
                  //         ),
                  //       ),
                  //     ),
                  //     //range slider
                  //   ],
                  // ),
                  RangeSlider(
                    values: values,
                    max: 1000,
                    // min: 50,
                    labels: RangeLabels(
                      values.start.round().toString(),
                      values.end.round().toString(),
                    ),
                    onChanged: (RangeValues value) {
                      setState(() {
                        values = value;
                      });
                    },
                    divisions: 40,
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
                        value: isKitchen,
                        onChanged: (value) {
                          isKitchen = value!;

                          setState(() {});
                        },
                      ),
                      const Text(
                        'Kitchen',
                        style: TextStyle(
                          fontSize: 15,
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
                              value: isSeaView,
                              onChanged: (value) {
                                setState(() {
                                  isSeaView = value!;
                                });
                              },
                            ),
                          ),
                          const Text(
                            'Sea View',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              checkColor: ColorManager.backGround,
                              fillColor: MaterialStateProperty.all(
                                  ColorManager.primary),
                              activeColor: ColorManager.error,
                              value: isAC,
                              onChanged: (value) {
                                setState(() {
                                  isAC = value!;
                                });
                              }),
                          const Text(
                            'A/C',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              checkColor: ColorManager.backGround,
                              fillColor: MaterialStateProperty.all(
                                  ColorManager.primary),
                              activeColor: ColorManager.error,
                              value: isWifi,
                              onChanged: (value) {
                                setState(() {
                                  isWifi = value!;
                                });
                              }),
                          const Text(
                            'Wifi          ',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              checkColor: ColorManager.backGround,
                              fillColor: MaterialStateProperty.all(
                                  ColorManager.primary),
                              activeColor: ColorManager.error,
                              value: isParking,
                              onChanged: (value) {
                                setState(() {
                                  isParking = value!;
                                });
                              }),
                          const Text(
                            'Parking',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              checkColor: ColorManager.backGround,
                              fillColor: MaterialStateProperty.all(
                                  ColorManager.primary),
                              activeColor: ColorManager.error,
                              value: isGarden,
                              onChanged: (value) {
                                setState(() {
                                  isGarden = value!;
                                });
                              }),
                          const Text(
                            'Garden   ',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
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
                    'Dictance from City Center',
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
                child: BlocBuilder<SearchCubit, SearchStates>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: ColorManager.white,
                        backgroundColor: ColorManager.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () async {
                        await BlocProvider.of<SearchCubit>(context)
                            .getHotelBySearchFilter(
                          facilites: [
                            isAC ? 5 : 0,
                            isWifi ? 6 : 0,
                            isGarden ? 7 : 0,
                            isParking ? 8 : 0,
                            isSeaView ? 9 : 0,
                            isKitchen ? 10 : 0
                          ],
                          minPrice: values.start,
                          maxPrice: values.end,
                        );
                        MagicRouter.navigateAndReplacement(
                          FilterResultView(
                              searchedForHotels:
                                  BlocProvider.of<SearchCubit>(context)
                                      .searchedForHotels!),
                        );
                      },
                      child: const Text("Apply"),
                    );
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

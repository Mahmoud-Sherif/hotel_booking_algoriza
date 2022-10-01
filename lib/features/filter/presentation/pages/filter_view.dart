import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/config/routes/magic_router.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';
import 'package:hotel_booking_algoriza/features/filter/presentation/pages/search_view.dart';
import '../../../../config/locale/app_localizations.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../injection_container.dart';
import '../../../profile/presentation/widgets/divider_widget.dart';
import '../cubit/search_cubit.dart';
import 'filter_result_view.dart';
import 'package:flutter_switch/flutter_switch.dart';

class FiltterScreen extends StatefulWidget {
  const FiltterScreen({super.key});

  @override
  State<FiltterScreen> createState() => _FiltterScreenState();
}

class _FiltterScreenState extends State<FiltterScreen> {
  RangeValues values = const RangeValues(20, 200);

  double distance = 10.0;
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
              MagicRouter.navigateAndReplacement(const SearchScreen());
            },
            icon: const Icon(Icons.close_rounded),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate('filter')!,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .translate('price_for_one_night')!,
                            style: TextStyle(
                                fontSize: 16, color: ColorManager.lightGrey),
                          ),
                          const SizedBox(height: 15),
                          SliderTheme(
                            data: const SliderThemeData(
                              trackHeight: 3,
                            ),
                            child: RangeSlider(
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
                          ),
                          dividerWidget(0, 0, 1),
                          const SizedBox(height: 10),
                          Text(
                            AppLocalizations.of(context)!
                                .translate('popular_filter')!,
                            style: TextStyle(
                              color: ColorManager.lightGrey,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            checkColor: ColorManager.backGround,
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    ColorManager.primary),
                                            activeColor: ColorManager.error,
                                            value: isKitchen,
                                            onChanged: (value) {
                                              isKitchen = value!;

                                              setState(() {});
                                            },
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .translate('kitchen')!,
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            checkColor: ColorManager.backGround,
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    ColorManager.primary),
                                            activeColor: ColorManager.error,
                                            value: isSeaView,
                                            onChanged: (value) {
                                              setState(() {
                                                isSeaView = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .translate('sea_view')!,
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor:
                                                  ColorManager.backGround,
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      ColorManager.primary),
                                              activeColor: ColorManager.error,
                                              value: isAC,
                                              onChanged: (value) {
                                                setState(() {
                                                  isAC = value!;
                                                });
                                              }),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .translate('a_c')!,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor:
                                                  ColorManager.backGround,
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      ColorManager.primary),
                                              activeColor: ColorManager.error,
                                              value: isWifi,
                                              onChanged: (value) {
                                                setState(() {
                                                  isWifi = value!;
                                                });
                                              }),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .translate('wifi')!,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor:
                                                  ColorManager.backGround,
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      ColorManager.primary),
                                              activeColor: ColorManager.error,
                                              value: isParking,
                                              onChanged: (value) {
                                                setState(() {
                                                  isParking = value!;
                                                });
                                              }),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .translate('parking')!,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              checkColor:
                                                  ColorManager.backGround,
                                              fillColor:
                                                  MaterialStateProperty.all(
                                                      ColorManager.primary),
                                              activeColor: ColorManager.error,
                                              value: isGarden,
                                              onChanged: (value) {
                                                setState(() {
                                                  isGarden = value!;
                                                });
                                              }),
                                          Text(
                                            AppLocalizations.of(context)!
                                                .translate('garden')!,
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          dividerWidget(0, 0, 1),
                          const SizedBox(height: 20),
                          Text(
                            AppLocalizations.of(context)!
                                .translate('distance_from_city_center')!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 3,
                            ),
                            child: Slider(
                                activeColor: ColorManager.primary,
                                inactiveColor: ColorManager.grey,
                                label:
                                    "Less than ${distance.round().toString()} km",
                                divisions: 100,
                                value: distance,
                                max: 25.0,
                                //min: 5
                                onChanged: (value) {
                                  setState(() {
                                    distance = value;
                                  });
                                }),
                          ),
                          dividerWidget(0, 0, 1),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .translate('type_of_accommodation')!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20),
                          flutterSwitch(
                            AppLocalizations.of(context)!.translate('all')!,
                            myValue,
                            (val) {
                              setState(() {
                                myValue = val;
                              });
                            },
                          ),
                          const SizedBox(height: 15),
                          dividerWidget(0, 0, 1),
                          const SizedBox(height: 15),
                          flutterSwitch(
                            AppLocalizations.of(context)!
                                .translate('apartment')!,
                            myValue,
                            (val) {
                              setState(() {
                                myValue = val;
                              });
                            },
                          ),
                          const SizedBox(height: 25),
                          flutterSwitch(
                            AppLocalizations.of(context)!.translate('home')!,
                            myValue,
                            (val) {
                              setState(() {
                                myValue = val;
                              });
                            },
                          ),
                          const SizedBox(height: 25),
                          flutterSwitch(
                            AppLocalizations.of(context)!.translate('villa')!,
                            myValue,
                            (val) {
                              setState(() {
                                myValue = val;
                              });
                            },
                          ),
                          const SizedBox(height: 25),
                          flutterSwitch(
                            AppLocalizations.of(context)!.translate('hotel')!,
                            myValue,
                            (val) {
                              setState(() {
                                myValue = val;
                              });
                            },
                          ),
                          const SizedBox(height: 25),
                          flutterSwitch(
                            AppLocalizations.of(context)!.translate('resort')!,
                            myValue,
                            (val) {
                              setState(() {
                                myValue = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                  ]),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
              bottom: 20.0, right: 20.0, left: 20.0, top: 10),
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
      ),
    );
  }

  Widget flutterSwitch(String text, bool value, Function(bool) onToggle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        //const SizedBox(width: 240),
        Container(
          child: FlutterSwitch(
              width: 52.0,
              height: 32.0,
              toggleSize: 28.0,
              value: value,
              borderRadius: 30.0,
              padding: 2.0,
              activeColor: Color(0xFF4ebb9c),
              inactiveColor: Color(0xFF38383a),
              //inactiveToggleColor: Color(0xFFffffff),
              //showOnOff: true,
              onToggle: onToggle),
        )
      ],
    );
  }
}

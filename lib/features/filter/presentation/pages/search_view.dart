import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';
import 'package:hotel_booking_algoriza/core/utils/media_query_values.dart';

import '../../../../core/widgets/custom_input_field.dart';
import '../widgets/search_result_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Explore',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              onPressed: (() {}),
              icon: const Icon(Icons.map_outlined),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: context.width / 1.35,
                      child: CustomInputField(
                        inputController: inputController,
                        hintText: 'london..',
                      ),
                    ),
                    // const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.primary,
                        ),
                        child: const Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Choose Date',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '23, sep - 28, sep',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 2,
                      height: 70,
                      color: Colors.grey,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Number of Room',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '1 Room, 2 People',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                color: Colors.grey,
                width: double.infinity,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '350 Hotel Found',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Filtter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context)=>FiltterScreen()));
                            },
                            icon: const Icon(
                              Icons.filter_list_outlined,
                              color: ColorManager.primary,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => const SearchResultWidget(),
              )
            ],
          ),
        )
        //
        );
  }
}

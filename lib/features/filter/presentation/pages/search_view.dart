import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/core/api/api_consumer.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';
import 'package:hotel_booking_algoriza/core/utils/media_query_values.dart';
import 'package:hotel_booking_algoriza/features/filter/presentation/cubit/search_cubit.dart';
import 'package:hotel_booking_algoriza/features/filter/presentation/widgets/map_widget.dart';
import 'package:hotel_booking_algoriza/injection_container.dart';

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
    return BlocProvider<SearchCubit>(
      create: (context) =>
          SearchCubit(apiConsumer: sl<ApiConsumer>())..getHotelBySearchValue(),
      // sl<SearchCubit>()..getHotelBySearchValue(),
      child: Scaffold(
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
            BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state) {
                return state is SearchToMapstate
                    ? IconButton(
                        onPressed: (() => BlocProvider.of<SearchCubit>(context)
                            .navigateToSearch()),
                        icon: const Icon(Icons.filter_list_outlined),
                      )
                    : IconButton(
                        onPressed: (() => BlocProvider.of<SearchCubit>(context)
                            .navigateToMap()),
                        icon: const Icon(Icons.map_outlined),
                      );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocConsumer<SearchCubit, SearchStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return SizedBox(
                        width: context.width / 1.35,
                        child: CustomInputField(
                          inputController: inputController,
                          hintText: 'london..',
                          onSubmitted: (value) {
                            BlocProvider.of<SearchCubit>(context)
                                .getHotelBySearchValue(value: value);
                          },
                        ),
                      );
                    },
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
            BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state) {
                return state is SearchToMapstate
                    ? Container()
                    : Column(
                        children: [
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
                                BlocBuilder<SearchCubit, SearchStates>(
                                    builder: (context, state) {
                                  return state is SearchLoadingState
                                      ? const Text(
                                          '0 Hotel Found',
                                        )
                                      : Text(
                                          '${BlocProvider.of<SearchCubit>(context).searchedForHotels!.hotelModel.search.length} Hotel Found',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        );
                                }),
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
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
              },
            ),
            BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state) {
                return state is SearchToMapstate
                    ? const MapTest()
                    : state is SearchLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: BlocProvider.of<SearchCubit>(context)
                                  .searchedForHotels!
                                  .hotelModel
                                  .search
                                  .length,
                              itemBuilder: (context, index) =>
                                  SearchResultWidget(
                                item: BlocProvider.of<SearchCubit>(context)
                                    .searchedForHotels,
                                index: index,
                              ),
                            ),
                          );
              },
            ),
          ],
        ),
        //
      ),
    );
  }
}

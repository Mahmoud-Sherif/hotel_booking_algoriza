import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_algoriza/config/routes/magic_router.dart';
import 'package:hotel_booking_algoriza/core/api/api_consumer.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';
import 'package:hotel_booking_algoriza/core/utils/media_query_values.dart';
import 'package:hotel_booking_algoriza/core/widgets/progrees_indicator.dart';
import 'package:hotel_booking_algoriza/features/filter/presentation/cubit/search_cubit.dart';
import 'package:hotel_booking_algoriza/features/filter/presentation/pages/filter_view.dart';
import 'package:hotel_booking_algoriza/features/filter/presentation/widgets/map_widget.dart';
import 'package:hotel_booking_algoriza/features/profile/presentation/widgets/divider_widget.dart';
import 'package:hotel_booking_algoriza/injection_container.dart';
import '../../../../config/locale/app_localizations.dart';
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
          title: Text(
            AppLocalizations.of(context)!.translate('explore')!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border, size: 25),
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
                        icon: const Icon(Icons.map_outlined, size: 25),
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
                      padding: const EdgeInsets.all(12),
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.translate('choose_date')!,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        //'23, Sep - 28, Oct',
                        AppLocalizations.of(context)!.translate('date')!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.grey,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!
                            .translate('number_of_room')!,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '1 ${AppLocalizations.of(context)!.translate('room')!} 2 ${AppLocalizations.of(context)!.translate('people')!}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state) {
                return state is SearchToMapstate
                    ? Container()
                    : Column(
                        children: [
                          dividerWidget(0, 0, 0),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BlocBuilder<SearchCubit, SearchStates>(
                                    builder: (context, state) {
                                  return state is SearchLoadingState
                                      ? Text(
                                          '0 ${AppLocalizations.of(context)!.translate('hotel_found')!}',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        )
                                      : Text(
                                          '${BlocProvider.of<SearchCubit>(context).searchedForHotels!.hotelModel.search.length}  ${AppLocalizations.of(context)!.translate('hotel_found')!}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        );
                                }),
                                Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .translate('filter')!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    IconButton(
                                      onPressed: () =>
                                          MagicRouter.navigateAndPopAll(
                                        const FiltterScreen(),
                                      ),
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
                          //SizedBox(height: 5,)
                        ],
                      );
              },
            ),
            BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state) {
                final marker = BlocProvider.of<SearchCubit>(context).markers;
                return state is SearchToMapstate
                    ? MapTest(markers: marker)
                    : state is SearchLoadingState
                        ? const CustmProgreesIndicator()
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

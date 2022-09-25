import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';
import 'package:hotel_booking_algoriza/core/utils/media_query_values.dart';
import 'package:hotel_booking_algoriza/core/utils/values_manager.dart';
import 'package:hotel_booking_algoriza/core/widgets/custom_input_field.dart';
import 'package:hotel_booking_algoriza/core/widgets/main_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
part '../widgets/indicator_view_hotel_btn.dart';
part '../widgets/best_hotel_widgets.dart';
part '../widgets/best_deal_card.dart';

class ExploreView extends StatelessWidget {
  ExploreView({super.key});
  final PageController boardController = PageController();
  final _conSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: context.toPadding * 2,
            pinned: true,
            // floating: true,
            title: CustomInputField(
              hintText: "Where are you going ?",
              prefixIcon: const Icon(
                Icons.search,
                color: ColorManager.lightGrey,
              ),
              inputController: _conSearch,
            ),
            expandedHeight: context.height / 2,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  PageView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return BestHotelsWidget();
                    },
                  ),
                  IndicatorAndViewHotelBTN(boardController: boardController),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Deals",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  TextButton.icon(
                    style: const ButtonStyle(
                      foregroundColor:
                          MaterialStatePropertyAll<Color>(ColorManager.primary),
                    ),
                    onPressed: () {},
                    icon: const Text('View all'),
                    label: const Icon(Icons.arrow_forward),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 8,
              (context, index) {
                return const BestDealWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';
import 'package:hotel_booking_algoriza/core/utils/media_query_values.dart';
import 'package:hotel_booking_algoriza/core/utils/values_manager.dart';
import 'package:hotel_booking_algoriza/core/widgets/custom_input_field.dart';
import 'package:hotel_booking_algoriza/core/widgets/main_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
part '../widgets/indicator_view_hotel_btn.dart';
part '../widgets/best_hotel_widgets.dart';

class ExploreView extends StatelessWidget {
  ExploreView({super.key});
  final PageController boardController = PageController();
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
            title: const CustomInputField(
              hintText: "Where are you going ?",
              prefixIcon: Icon(
                Icons.search,
                color: ColorManager.lightGrey,
              ),
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
            child: Container(
              width: context.width / 2,
              height: 200,
              color: Colors.grey,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: context.width / 2,
              height: 200,
              color: Colors.blue,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: context.width / 2,
              height: 200,
              color: Colors.orange,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: context.width / 2,
              height: 200,
              color: Colors.grey,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: context.width / 2,
              height: 200,
              color: Colors.blue,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: context.width / 2,
              height: 200,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}

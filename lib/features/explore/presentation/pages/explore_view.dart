import 'package:flutter/material.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';
import 'package:hotel_booking_algoriza/core/utils/media_query_values.dart';
import 'package:hotel_booking_algoriza/core/utils/values_manager.dart';
import 'package:hotel_booking_algoriza/core/widgets/custom_input_field.dart';
import 'package:hotel_booking_algoriza/core/widgets/main_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

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
              background: PageView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return BestHotelsWidget();
                },
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

class BestHotelsWidget extends StatelessWidget {
  BestHotelsWidget({
    Key? key,
  }) : super(key: key);
  final PageController boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/capetown.jpg',
          fit: BoxFit.fitHeight,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p20, horizontal: AppPadding.p20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cape Town',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 5),
              Text(
                'Extraodinart five-star',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              Text(
                'outdoor activites',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              const SizedBox(height: 10),
              MainButton(
                text: "View Hotel",
                width: context.width / 2.8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SmoothPageIndicator(
                  controller: boardController,
                  effect: const SwapEffect(
                    dotColor: ColorManager.lightGrey,
                    activeDotColor: ColorManager.primary,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    spacing: 5.0,
                  ),
                  count: 3,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RoundedSearchInput extends StatelessWidget {
  // final TextEditingController textController;
  final String hintText;
  const RoundedSearchInput({required this.hintText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        // controller: textController,
        onChanged: (value) {
          //Do something wi
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[500]!,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(45.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(45.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(45.0)),
          ),
        ),
      ),
    );
  }
}

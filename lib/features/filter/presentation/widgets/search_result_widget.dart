import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_booking_algoriza/core/utils/color_manager.dart';
import 'package:hotel_booking_algoriza/core/utils/media_query_values.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Container(
            width: context.width / 1.1,
            height: context.height / 2.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.1),
              //     spreadRadius: 1,
              //     blurRadius: 4,
              //     offset: const Offset(0, 4),
              //   ),
              // ],
              color: ColorManager.secondry,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/261102/pexels-photo-261102.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: double.infinity,
                  height: 200,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, top: 8),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: ColorManager.secondry,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: ColorManager.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Grand Royal Hotel',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 18),
                      ),
                      Text(
                        '\$180',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 22),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Wembley, London',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.location_on_rounded,
                            size: 16,
                            color: Color(0xff4fbe9e),
                          ),
                          Text(
                            '2.0km to city',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        '/per night',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      RatingBar.builder(
                        minRating: 1,
                        maxRating: 5,
                        initialRating: 4.5,
                        allowHalfRating: true,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 16,
                        itemPadding: const EdgeInsets.symmetric(
                          horizontal: 2.0,
                        ),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Color(0xff4fbe9e),
                        ),
                        onRatingUpdate: (double value) {},
                      ),
                      const Text(
                        '80 Reviews',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

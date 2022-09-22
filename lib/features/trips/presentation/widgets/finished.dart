import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Finished extends StatelessWidget {
  const Finished({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 130,
                    height: 140,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.pexels.com/photos/261102/pexels-photo-261102.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: [
                              const TextSpan(
                                text: 'Grand Royal Hotel \n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const TextSpan(
                                text: 'Wembley, London \n',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              TextSpan(
                                text: '01 Sep - 05 Sep \n',
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                ),
                              ),
                              TextSpan(
                                text: '1 Room 2 People',
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.location_on_rounded,
                              size: 16,
                              color: Color(0xff4fbe9e),
                            ),
                            Text(
                              '2.0 km to city',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ],
                        ),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: '\$180',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: '/per night',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

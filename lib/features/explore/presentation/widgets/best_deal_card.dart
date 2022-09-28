part of '../pages/explore_view.dart';

class BestDealWidget extends StatelessWidget {
  const BestDealWidget({
    Key? key,
    required this.hotelData,
  }) : super(key: key);
  final HotelModel hotelData;
  @override
  Widget build(BuildContext context) {
    final rate = double.parse(hotelData.rate);
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16, vertical: AppPadding.p16),
      child: InkWell(
        onTap: () {
          MagicRouter.navigateTo(HotelDetailsScreen(hotelData: hotelData,));
        },
        child: Container(
          decoration: const BoxDecoration(
            color: ColorManager.secondry,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          width: context.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: context.width / 3,
                height: context.height / 6,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  image: DecorationImage(
                    image: hotelData.hotelImages.isEmpty
                        ? const NetworkImage(
                            'https://imgs.search.brave.com/OfBRIvITSpCS29VuDbnGRwD3-iJTCt4FHomJr_pylCY/rs:fit:1200:1200:1/g:ce/aHR0cDovL3llc29m/Y29yc2EuY29tL3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE3LzA0/L0hvdGVscy1IaWdo/LVF1YWxpdHktV2Fs/bHBhcGVyLmpwZw',
                          )
                        : NetworkImage(
                            EndPoints.imageBaseUrl +
                                hotelData.hotelImages[0].image,
                          ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: SizedBox(
                  width: context.width / 2,
                  height: context.height / 7.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: '${hotelData.name} \n',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            TextSpan(
                              text: '${hotelData.address} \n',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children:  [
                                  Icon(
                                    Icons.location_on_rounded,
                                    size: 16,
                                    color: Color(0xff4fbe9e),
                                  ),
                                  Text(
                                    '2.0 ${AppLocalizations.of(context)!.translate('km_to_city')!}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "\$${hotelData.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: 22),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RatingBar.builder(
                                minRating: 1,
                                maxRating: 5,
                                initialRating: rate,
                                allowHalfRating: true,
                                direction: Axis.horizontal,
                                itemCount: 5,
                                itemSize: 16,
                                itemPadding: const EdgeInsets.symmetric(
                                  horizontal: 2.0,
                                ),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: ColorManager.primary,
                                ),
                                onRatingUpdate: (double value) {},
                              ),
                               Text(
                                "/${AppLocalizations.of(context)!.translate('per_night')!}",
                                style: TextStyle(color: ColorManager.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
} 
/*

             
              */
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
          MagicRouter.navigateTo(HotelDetailsScreen(
            hotelData: hotelData,
          ));
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
              SizedBox(
                width: context.width / 3,
                height: context.height / 5.5,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/place_holder.png',
                    image:
                        EndPoints.imageBaseUrl + hotelData.hotelImages[0].image,
                    fit: BoxFit.cover,
                    placeholderFit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: SizedBox(
                  width: context.width / 2,
                  height: context.height / 6.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hotelData.name,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 14),
                      ),
                      Text(
                        hotelData.address,
                        style: Theme.of(context).textTheme.displaySmall,
                        maxLines: 2,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_rounded,
                                    size: 16,
                                    color: ColorManager.primary,
                                  ),
                                  BlocBuilder<ExploreCubit, ExploreState>(
                                    builder: (context, state) {
                                      Position myPosition =
                                          BlocProvider.of<ExploreCubit>(context)
                                              .myPosition;
                                      return Text(
                                        '${Geolocator.distanceBetween(myPosition.latitude, myPosition.longitude, double.parse(hotelData.lat), double.parse(hotelData.long)).toStringAsFixed(0)} km',
                                        // '2.0 ${AppLocalizations.of(context)!.translate('km_to_city')!}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      );
                                    },
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

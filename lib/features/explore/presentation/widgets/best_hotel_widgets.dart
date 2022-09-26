part of '../pages/explore_view.dart';

class BestHotelsWidget extends StatelessWidget {
  BestHotelsWidget({
    Key? key,
    required this.hotelData,
  }) : super(key: key);
  final PageController boardController = PageController();
  final HotelModel hotelData;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        hotelData.hotelImages.isEmpty
            ? Image.asset(
                'assets/images/capetown.jpg',
                fit: BoxFit.fitHeight,
              )
            : Image.network(
                EndPoints.imageBaseUrl + hotelData.hotelImages[0].image,
                fit: BoxFit.cover,
              ),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p20, horizontal: AppPadding.p20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Text(
                hotelData.name,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 5),
              Text(
                hotelData.description,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 18),
              ),

              const SizedBox(height: 10),
              // MainButton(
              //   text: "View Hotel",
              //   width: context.width / 2.8,
              // ),
            ],
          ),
        )
      ],
    );
  }
}

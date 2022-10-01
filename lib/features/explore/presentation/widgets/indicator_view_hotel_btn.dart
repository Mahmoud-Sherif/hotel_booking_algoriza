part of '../pages/explore_view.dart';

class IndicatorAndViewHotelBTN extends StatelessWidget {
  const IndicatorAndViewHotelBTN({
    Key? key,
    required this.boardController,
  }) : super(key: key);

  final PageController boardController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 45,
              width: context.width / 3,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Veiw Hotel')),
            ),
            SmoothPageIndicator(
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
          ],
        ),
      ),
    );
  }
}

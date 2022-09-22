part of '../pages/explore_view.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
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

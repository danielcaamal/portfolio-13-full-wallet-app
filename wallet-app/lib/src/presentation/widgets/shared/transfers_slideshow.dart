import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:wallet_app/src/domain/domain.dart';
import 'package:wallet_app/src/presentation/utils/human_formats.dart';

class TransfersSlideShow extends StatelessWidget {
  final List<Transfer> transfers;

  const TransfersSlideShow({super.key, this.transfers = const []});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 75,
        width: double.infinity,
        child: Swiper(
            viewportFraction: 0.8,
            scale: 0.9,
            autoplay: true,
            itemCount: transfers.length,
            itemBuilder: (context, index) => _Slide(transfer: transfers[index]),
            pagination: SwiperPagination(
              margin: const EdgeInsets.only(top: 10),
              builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary,
                color: colors.secondary,
              ),
            )),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Transfer transfer;
  const _Slide({required this.transfer});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black54,
          blurRadius: 10,
          offset: Offset(0, 10),
        ),
      ],
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.surface,
              shadowColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _AccountSlideshow(
                      icon: transfer.accountSource?.icon ?? '',
                      color: transfer.accountSource?.color ?? "",
                      description: transfer.accountSource?.description ?? ''),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_forward,
                          color: Theme.of(context).colorScheme.primary),
                      Text(HumanFormats.numberToCurrency(transfer.amount))
                    ],
                  ),
                  _AccountSlideshow(
                      icon: transfer.accountDestination?.icon ?? '',
                      color: transfer.accountDestination?.color ?? "",
                      description:
                          transfer.accountDestination?.description ?? ''),
                ],
              ),
            )),
      ),
    );
  }
}

class _AccountSlideshow extends StatelessWidget {
  const _AccountSlideshow({
    required this.icon,
    required this.color,
    required this.description,
  });

  final String icon;
  final String color;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          size: 25,
          iconsEnum[icon] ?? Icons.monetization_on_outlined,
          color: HumanFormats.hexToColor(color),
        ),
        Text(description),
      ],
    );
  }
}

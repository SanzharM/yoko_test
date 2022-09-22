import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yoko_test/core/constants/constants.dart';
import 'package:yoko_test/core/services/utils.dart';
import 'package:yoko_test/main/domain/models/activity.dart';
import 'package:yoko_test/main/presentation/app_router.dart';
import 'package:yoko_test/main/presentation/widgets/buttons/app_button.dart';
import 'package:yoko_test/main/presentation/widgets/buttons/app_cell.dart';
import 'package:yoko_test/main/presentation/widgets/buttons/app_icon_button.dart';
import 'package:yoko_test/main/presentation/widgets/info_field.dart';
import 'package:yoko_test/main/presentation/widgets/separators/horizontal_separator.dart';

class ActivityDetailsScreen extends StatefulWidget {
  const ActivityDetailsScreen({Key? key, required this.activity}) : super(key: key);

  final Activity activity;

  @override
  State<ActivityDetailsScreen> createState() => _ActivityDetailsScreenState();
}

class _ActivityDetailsScreenState extends State<ActivityDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: Image.asset(
          AppAssets.shymbulakLogo,
          height: 48.0,
          fit: BoxFit.cover,
          errorBuilder: (_, obj, trace) => const Icon(
            CupertinoIcons.exclamationmark_circle_fill,
            color: AppColors.blueGradient1,
          ),
        ),
        centerTitle: true,
        leading: AppIconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp, color: AppColors.white),
          onPressed: () => AppRouter.back(context),
        ),
      ),
      body: CupertinoScrollbar(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.activity.imageUrl ?? '',
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.width * 0.7,
                    placeholder: (_, str) => const CupertinoActivityIndicator(color: AppColors.blueGradient1),
                    errorWidget: (_, obj, trace) => const Icon(CupertinoIcons.exclamationmark_circle_fill),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.width * 0.7,
                    child: DecoratedBox(
                      decoration: BoxDecoration(gradient: AppColors.blackShadowGradient),
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.width * 0.7,
                    child: DecoratedBox(
                      decoration: BoxDecoration(gradient: AppColors.blueShadowGradient),
                    ),
                  ),
                  Container(
                    height: AppConstraints.radius,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: AppConstraints.borderRadiusTLR,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(AppConstraints.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const InfoField(
                      title: 'Дата посещения',
                      value: 'Подзаголовок в одну строку',
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: AppConstraints.padding),
                      child: HorizontalSeparator(),
                    ),
                    AppCell(
                      title: 'Выберите дату',
                      onPressed: () => debugPrint('ShowModalBottomSheet (DatePicker)'),
                      needBorder: true,
                      leading: const Icon(Icons.calendar_today, color: AppColors.blueGradient1),
                      icon: const Icon(CupertinoIcons.forward, color: AppColors.blueGradient1),
                    ),
                    if (widget.activity.tariffs?.isNotEmpty ?? false) ...[
                      ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: AppConstraints.padding),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.activity.tariffs!.length,
                        separatorBuilder: (_, sep) => const SizedBox(height: AppConstraints.padding / 2),
                        itemBuilder: (_, i) {
                          final tariff = widget.activity.tariffs!.elementAt(i);
                          if (!tariff.enabled) {
                            return const SizedBox();
                          }
                          return AppCell(
                            title: tariff.name ?? '',
                            subtitle: Utils.formatPrice(tariff.price, currency: tariff.currency),
                            needBorder: false,
                            fillColor: AppColors.greyLight,
                            icon: const Icon(CupertinoIcons.add_circled, color: AppColors.blueGradient1),
                            onPressed: () => debugPrint('handle AddTariff'),
                          );
                        },
                      ),
                      const SizedBox(height: AppConstraints.padding),
                      AppButton(
                        title: 'Перейти к оплате',
                        textStyle: Theme.of(context).textTheme.bodyMedium?.apply(color: AppColors.white),
                        onPressed: () => debugPrint('handle StartPayment'),
                      ),
                    ],
                    const SizedBox(height: AppConstraints.padding * 2),
                    const HorizontalSeparator(),
                    AppCell(
                      title: 'Правила поведения в сноупарке',
                      padding: const EdgeInsets.symmetric(vertical: AppConstraints.padding),
                      icon: const Icon(CupertinoIcons.forward, color: AppColors.blueGradient1),
                      onPressed: () => debugPrint('Either navigate to screen, either open inAppWebview'),
                    ),
                    const HorizontalSeparator(),
                    AppCell(
                      title: 'Позвонить',
                      titleStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.blueGradient1,
                          ),
                      padding: const EdgeInsets.symmetric(vertical: AppConstraints.padding),
                      icon: const Icon(CupertinoIcons.forward, color: AppColors.blueGradient1),
                      // ignore: deprecated_member_use
                      onPressed: () async => await launch('tel:77011234567'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

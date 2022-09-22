import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoko_test/core/constants/constants.dart';
import 'package:yoko_test/main/domain/models/activity.dart';
import 'package:yoko_test/main/presentation/app_router.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({Key? key, required this.activity}) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    // TODO set placeholder for background image;
    return CupertinoButton(
      padding: EdgeInsets.zero,
      pressedOpacity: 0.7,
      onPressed: () => AppRouter.toActivityDetailsScreen(context: context, activity: activity),
      child: ClipRRect(
        borderRadius: AppConstraints.borderRadius,
        child: SizedBox(
          height: MediaQuery.of(context).size.width * 0.7,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: activity.imageUrl ?? '',
                fit: BoxFit.cover,
                height: double.maxFinite,
                width: double.maxFinite,
                placeholder: (_, str) => const CupertinoActivityIndicator(color: AppColors.blueGradient1),
                errorWidget: (_, obj, trace) => const SizedBox(),
              ),
              Container(
                height: double.maxFinite,
                width: double.maxFinite,
                padding: const EdgeInsets.all(AppConstraints.padding),
                decoration: BoxDecoration(
                  gradient: AppColors.blackBlueGradient,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.nameRu ?? activity.nameKk ?? activity.nameEn ?? '',
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleLarge?.apply(color: AppColors.white),
                    ),
                    if (activity.description?.isNotEmpty ?? false) ...[
                      const SizedBox(height: AppConstraints.padding / 2),
                      Text(
                        activity.description!,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodySmall?.apply(color: AppColors.white),
                      ),
                    ],
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

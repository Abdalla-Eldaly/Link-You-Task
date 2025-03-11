import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../presentaion/resources/color_manager.dart';
import '../../../presentaion/resources/values_manager.dart';
class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManager.shimmerBase,
      highlightColor: ColorManager.shimmerHighlight,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s12),
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey?.withOpacity(0.1) ?? Colors.grey.shade50,
              blurRadius: AppSize.s0_6,
              spreadRadius: AppSize.s2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: AppSize.s16,
              color: ColorManager.white,
            ),
            const SizedBox(height: AppSize.s8),
            Container(
              width: double.infinity,
              height: AppSize.s14,
              color: ColorManager.white,
            ),
            const SizedBox(height: AppSize.s12),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: AppSize.s8,
                    color: ColorManager.white,
                  ),
                ),
                const SizedBox(width: AppSize.s8),
                Container(
                  width: AppSize.s24,
                  height: AppSize.s24,
                  decoration: const BoxDecoration(
                    color: ColorManager.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

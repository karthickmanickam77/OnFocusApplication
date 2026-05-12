import 'package:cookbook/Helpers/Responsive.dart';
import 'package:cookbook/Pages/InsightScreen/InsightsScreenVM.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InsightsHeaderScreen
    extends ConsumerWidget {

  const InsightsHeaderScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {

    final vm =
        ref.watch(insightsScreenProvider);

    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,

      children: [

        Text(
          'Insights',

          style: TextStyle(
            fontFamily: 'SFProRounded',

            fontSize:
                ResponsiveUI.sp(30, context),

            fontWeight: FontWeight.w600,
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(
            horizontal:
                ResponsiveUI.w(12, context),
          ),

          width: ResponsiveUI.w(123, context),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              ResponsiveUI.r(8, context),
            ),

            color: Colors.white,

            boxShadow: [
              BoxShadow(
                color: Color(0xff000000)
                    .withOpacity(0.25),

                offset: Offset(1, 0),

                blurRadius:
                    ResponsiveUI.r(4, context),
              ),
            ],
          ),

          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(

              isExpanded: true,

              value: vm.selectedFilter,

              borderRadius:
                  BorderRadius.circular(
                ResponsiveUI.r(16, context),
              ),

              icon: Icon(
                Icons.expand_more_rounded,

                color: Colors.black,

                size:
                    ResponsiveUI.sp(25, context),
              ),

              style: TextStyle(
                fontFamily: 'SFProRounded',

                color: Colors.black,

                fontSize:
                    ResponsiveUI.sp(16, context),

                fontWeight: FontWeight.w600,
              ),

              items: vm.filters.map((filter) {

                return DropdownMenuItem<String>(
                  value: filter,

                  child: Text(filter),
                );

              }).toList(),

              onChanged: (value) {

                if (value != null) {

                  ref
                      .read(
                        insightsScreenProvider,
                      )
                      .changeFilter(value);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
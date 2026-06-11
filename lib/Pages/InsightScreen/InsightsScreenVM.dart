import 'package:cookbook/Helpers/Utilities/Enums/InsightsFilter.dart';
import 'package:cookbook/Helpers/Utilities/Enums/WeekDay.dart';
import 'package:cookbook/Pages/InsightScreen/InsightsScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final insightsScreenProvider =
    ChangeNotifierProvider((ref) => InsightsScreenVM());

class InsightsScreenVM extends InsightsScreenModel with ChangeNotifier {
  InsightsScreenVM() {
    initialize();
  }
  initialize() {
    changeFilter(InsightFilter.thisWeek);
    // changeFilter("This Week");
    addFilter([
      InsightFilter.today,
      InsightFilter.thisWeek,
      InsightFilter.thisMonth,
    ]);

    // addFilter([
    //   "Today",
    //   "This Week",
    //   "This Month",
    // ]);
    setDays([
      WeekDay.monday,
      WeekDay.tuesday,
      WeekDay.wednesday,
      WeekDay.thursday,
      WeekDay.friday,
      WeekDay.saturday,
      WeekDay.sunday,
    ]);
    // setDays([
    //   "M",
    //   "Tu",
    //   "W",
    //   "Th",
    //   "F",
    //   "Sa",
    //   "Su",
    // ]);
  }

  void changeFilter(InsightFilter filter) {
    setSelectedFilter(filter);
    notifyListeners();
  }

  void addFilter(List<InsightFilter> filters) {
    setFilters(filters);
    notifyListeners();
  }

  List<WeekDay> getGraphList() {
    return getDays();
  }
}

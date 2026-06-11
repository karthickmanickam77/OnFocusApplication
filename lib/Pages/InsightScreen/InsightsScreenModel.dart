// import 'package:cookbook/Helpers/Language_Localization/app_localizations.dart';

import 'package:cookbook/Helpers/Utilities/Enums/InsightsFilter.dart';
import 'package:cookbook/Helpers/Utilities/Enums/WeekDay.dart';

class InsightsScreenModel {
  List<InsightFilter> filters = [];
  InsightFilter selectedFilter = InsightFilter.today;
  List<WeekDay> days = [];

  void setDays(List<WeekDay> days) {
    this.days = days;
  }

  List<WeekDay> getDays() {
    return days;
  }

  void setFilters(List<InsightFilter> filters) {
    this.filters = filters;
  }

  void setSelectedFilter(InsightFilter selectedFilter) {
    this.selectedFilter = selectedFilter;
  }

  InsightFilter getSelectedFilter() {
    return selectedFilter;
  }
}

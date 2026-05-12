import 'package:cookbook/Pages/InsightScreen/InsightsScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final insightsScreenProvider = ChangeNotifierProvider((ref) => InsightsScreenVM());
class InsightsScreenVM extends InsightsScreenModel with ChangeNotifier{
  InsightsScreenVM(){
    
    initialize();
  }
  initialize(){
    changeFilter("This Week");
    addFilter([
      "Today",
      "This Week",
      "This Month",
    ]);
    setDays([
      "M",
      "Tu",
      "W",
      "Th",
      "F",
      "Sa",
      "Su",
    ]);
  }
  void changeFilter(String filter){
    setSelectedFilter(filter);
    notifyListeners();
  }
  void addFilter(List<String> filters){
    setFilters(filters);
    notifyListeners();
  }
  List<String> getGraphList(){
    return getDays();
  }
}
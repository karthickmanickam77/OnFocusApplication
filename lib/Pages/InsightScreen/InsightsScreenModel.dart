class InsightsScreenModel{

  List<String> filters = [];
  String selectedFilter = '';
  List<String> days = [];
  
  
  void setDays(List<String> days){
    this.days=days;
  }
  List<String> getDays(){
    return days;
  }

  void setFilters(List<String> filters){
    this.filters=filters;
  }
  
  void setSelectedFilter(String selectedFilter){
    this.selectedFilter=selectedFilter;
  }
  String getSelectedFilter(){
    return selectedFilter;
  }
}
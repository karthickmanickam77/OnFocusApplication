import 'package:cookbook/Pages/SmartSuggestion/SmartSuggestionScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final smartsuggestionscreenprovider = ChangeNotifierProvider((ref) => SmartSuggestionScreenVM());
class SmartSuggestionScreenVM extends SmartSuggestionScreenModel with ChangeNotifier{
  SmartSuggestionScreenVM(){
    initialize();
  }
  void initialize(){
    
  }
}
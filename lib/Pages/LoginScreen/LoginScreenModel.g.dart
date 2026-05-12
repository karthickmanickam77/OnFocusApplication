// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginScreenModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginScreenModel on _LoginScreenModelBase, Store {
  late final _$universityDetailsAtom =
      Atom(name: '_LoginScreenModelBase.universityDetails', context: context);

  @override
  List<UniversityBO> get universityDetails {
    _$universityDetailsAtom.reportRead();
    return super.universityDetails;
  }

  bool _universityDetailsIsInitialized = false;

  @override
  set universityDetails(List<UniversityBO> value) {
    _$universityDetailsAtom.reportWrite(
        value, _universityDetailsIsInitialized ? super.universityDetails : null,
        () {
      super.universityDetails = value;
      _universityDetailsIsInitialized = true;
    });
  }

  late final _$_LoginScreenModelBaseActionController =
      ActionController(name: '_LoginScreenModelBase', context: context);

  @override
  void setUniversityDetails(List<UniversityBO> universityDetails) {
    final _$actionInfo = _$_LoginScreenModelBaseActionController.startAction(
        name: '_LoginScreenModelBase.setUniversityDetails');
    try {
      return super.setUniversityDetails(universityDetails);
    } finally {
      _$_LoginScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
universityDetails: ${universityDetails}
    ''';
  }
}

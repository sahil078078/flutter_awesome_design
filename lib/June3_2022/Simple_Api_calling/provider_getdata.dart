import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/June3_2022/Simple_Api_calling/fetchDatafunction.dart';

import 'modal_class.dart';

class ProviderForGetData extends ChangeNotifier {
  late ModalClass modalClass;

  bool isLoading = false;

  getPostData(context) async {
    isLoading = true;
    modalClass = await fetchData3june1();
    isLoading = false;

    notifyListeners();
  }
}

class SelectCategoryIndex extends ChangeNotifier {
  int selectCategoryIndex = 0;

  getCategoryIndex({required int index}) {
    selectCategoryIndex = index;
    notifyListeners();
  }
}

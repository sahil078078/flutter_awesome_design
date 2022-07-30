import 'package:flutter/material.dart';

import 'fetch_data_function.dart';
import 'modal_class.dart';

class ProviderForGetData extends ChangeNotifier {
  late ModalClass modalClass;

  bool isLoading = false;
  // use for best ux experience but i don't used now this time

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

import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:provider/provider.dart';

class providers extends ChangeNotifier{
  bool isDonor;
var user;
  providers({ this.isDonor=true});

  bool ChangeToHospitalStaff(bool val){
    isDonor=val;
    notifyListeners();
    return isDonor;
  }
   currentUser(var val){
    user=val;
    notifyListeners();
    return user;
  }
}
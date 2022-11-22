import 'package:flutter/cupertino.dart';
TextEditingController dateinput = TextEditingController();
TextEditingController controller= TextEditingController();
TextEditingController fillBycontroller= TextEditingController();
TextEditingController briefOverview= TextEditingController();
TextEditingController timelineestimation= TextEditingController();
TextEditingController overallCost= TextEditingController();
TextEditingController developmentProcedure= TextEditingController();
TextEditingController futureServices= TextEditingController();
TextEditingController copyLinenceAndRight= TextEditingController();
TextEditingController budgetController=TextEditingController();
TextEditingController sNoController= TextEditingController();
TextEditingController featureController=TextEditingController();
TextEditingController costController= TextEditingController();
class HomeScreenProvider extends ChangeNotifier {
int onTapValue=0;
int estimateTimeLine=0;
int deleverableTabel=0;
int projectBreakDown=0;
int frontEndDesign=0;
int backEndDesign=0;
int increment=0;
int testingDebuging=0;
int futureServices=0;
int copyRightLiensing=0;
int other=0;


  int initialvalue=0;



   void onChangedTabBar(int a){
     initialvalue=a;
     notifyListeners();
   }
   ///
/// set the Date
  void dateInput(String formatDate){
    dateinput.text=formatDate;
    notifyListeners();
  }
  ///
/// overview toggle
  void overViewToggle(int a){
     onTapValue=a;

     notifyListeners();
  }

  ///
/// estimated Timeline toggle
void estimateTimeLineToggle(int a){
  estimateTimeLine=a;
  notifyListeners();
}
///
/// deleverableTabel
void deleverableTabelToggle(int a){
  deleverableTabel=a;
  notifyListeners();
}
///
/// project breakDown
void projectBreakDownToggle(int a){
  projectBreakDown=a;
  notifyListeners();
}
void frontEndDesignToggle(int a){
  frontEndDesign=a;
  notifyListeners();
}
void backEndDesignToggle(int a){
 backEndDesign=a;
  notifyListeners();
}
void testingDebugingToggle(int a){
  testingDebuging=a;
  notifyListeners();
}
void futureServicesToggle(int a){
  futureServices=a;
  notifyListeners();
}
void copyRightLiensingToggle(int a){
  copyRightLiensing=a;
  notifyListeners();
}
void otherToggle(int a){
  other=a;
  notifyListeners();
}






}
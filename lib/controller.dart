import 'package:get/get.dart';

class cntr extends GetxController{
  RxInt total=0.obs;
  RxList<bool> cat = List.filled(5, false).obs;
  getTotal(int prise,val,index){
    val!?total+=prise:total-=prise;
   // cat[index]=val;
  }
}
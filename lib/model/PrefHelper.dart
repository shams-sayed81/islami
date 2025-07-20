import 'package:islamic13/model/constants.dart';
import 'package:islamic13/model/suraModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
 class PrefHelper {
static late SharedPreferences pref;

static init() async{
  pref =await SharedPreferences.getInstance();

}

static  onboardingOpened (String key , bool value) async{
  return await pref.setBool(key ,value);
}

 static bool? getBool(String key){
  return pref.getBool(key);
}

static addRecentList (List<Surah> mostRecentList){
  List<String> addRecentStringList = mostRecentList.map((surah) => surah.englishName).toList();
pref.setStringList('mostRecent', addRecentStringList);

}
static List<Surah> getRecentList (){
  List<String> mostStringList= pref.getStringList('mostRecent')??[]; //هنا برجع الليست اللي فيها اسامي
  List<Surah> mostList =[]; //ليست جديده  من نوع سوره
 for (String suraName in mostStringList){ //هنا بعدي علي كل اسم في ليست الاسامي
   Surah surah= suraList.firstWhere((sura) => sura.englishName==suraName,); //  هنا بقارن كل اسم سوره بأول object عنده نفس الاسم في الليست الاساسيه واخزن اللي هيطلع في object
   mostList.add(surah); // بضيف الobject هنا وكدا اقدر اعرض الليست كل مره

 }
 return mostList;
}

}
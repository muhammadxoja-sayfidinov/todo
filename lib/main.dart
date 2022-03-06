import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/plan_models.dart';
import 'package:todo/widgets/date_of_plans.dart';
import 'package:todo/widgets/modalBottom.dart';
import 'package:todo/widgets/planList.dart';
import 'package:todo/widgets/plansOfdata.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: GoogleFonts.adamina().fontFamily
      ),
      home:HomePage (),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Plans plans = Plans();
  DateTime markedDay = DateTime.now();
  void openCalendar(BuildContext context){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
    ).then((selectedDay){
      if (selectedDay != null){
        setState(() {
          markedDay = selectedDay;
        });
      };
    });
  }
  void nextDay() {
    setState(() {
      markedDay = DateTime(markedDay.year,markedDay.month,markedDay.day+1);
    });
  }
  void beforeDay(){
    setState(() {
      markedDay = DateTime(markedDay.year,markedDay.month,markedDay.day-1);
    });
  }
  void markDone(String idPlan){
    setState(() {
      plans.sortByDay(markedDay).firstWhere((plan) => plan.id == idPlan).toggleDone();
    });

  }
  void planDelete(String idPLan){
    setState(() {
      plans.deletePlan(idPLan);

    });
  }
  void addPlan(String planName, DateTime planDate){
    setState(() {
      plans.addPlan(planName, planDate);
    });
    Navigator.of(context).pop();

  }
  void addPlanWindow(BuildContext context){
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
        context: context,
        builder: (ctx){
      return ModalBottom(addPlan);
    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Todo App'),
        centerTitle:true,),
      body: Column(
        children:    [
          DateOfPlans(openCalendar,markedDay,nextDay,beforeDay),
          PlansOfData(plans.sortByDay(markedDay)),
          PlanList(plans.sortByDay(markedDay),markDone,planDelete,plans.sortByDay(markedDay)),
        ],
      ),
       floatingActionButton:  FloatingActionButton(
         onPressed: (){addPlanWindow(context);},
         child: const Icon(Icons.add,color: Colors.black,),
         backgroundColor: Colors.amber,)
    );
  }
}
import 'package:todo/widgets/plan.dart';

class PlansModel{
  final String id;
  final String name;
  final DateTime day;
  bool isDone = false;

  PlansModel({
    required this.id,
    required this.name,
    required this.day,
  });

  void toggleDone(){
    isDone = !isDone;
  }
}

class Plans{
   final List<PlansModel> _list = [
  ];

  List<PlansModel> get list{
    return _list;
  }
  List<PlansModel>  sortByDay(DateTime date){
    return _list.where((todo) =>
        todo.day.day == date.day &&
        todo.day.month == date.month &&
        todo.day.year == date.year ).toList();
  }
  void addPlan(String name, DateTime day){
    list.add(
      PlansModel(
          id: '${list.length}',
          name: name,
          day: day)
    );
  }
  void deletePlan(String id){
    list.removeWhere((plan) => plan.id == id);
  }

}
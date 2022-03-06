import 'package:flutter/material.dart';
import 'package:todo/models/plan_models.dart';
import 'package:todo/widgets/plan.dart';

class PlanList extends StatelessWidget {
  final List<PlansModel> plans;
  final Function markDone;
  final Function planDelete;
  final List<PlansModel> planSortBy;
  PlanList(this.plans, this.markDone,this.planDelete,this.planSortBy);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: planSortBy.length > 0 ?
      ListView.builder(
        itemCount:planSortBy.length,
        itemBuilder: (ctx,index){
        return  Plan(plans[index],markDone,planDelete,);
      },):
       Center(
        child: Column(
          children:  [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('No plans',style: TextStyle(fontSize: 25,),),
            ),
              Image.asset('image/3094837.png',width: MediaQuery.of(context).size.width * 0.4),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'unit_calc.dart';

Container itemMaker(String txtItem, IconData iconItem, Color color, BuildContext context,String type) {
  return Container(
    padding: const EdgeInsets.only(top: 20),
    child: Material(
      color: Colors.black,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => UnitCalc(color,type)));
        },
        child: Container(
          width: 250,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(iconItem),
                Text(
                  txtItem,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class CustomList extends StatelessWidget
{
  const CustomList({super.key});


  @override
  Widget build(BuildContext context) {

  final List<String> convList = ['Temp','Length','Time'];
   final List<IconData> iconList = [Icons.ac_unit_outlined,Icons.accessibility_rounded,Icons.access_time_outlined];
    return
        SizedBox(
          height: 500,
            width: 300,
            child: SizedBox(
              height:400 ,
              width:50 ,
              child:
                       ListView.builder(
                          itemCount: 1,
                          itemBuilder:(context,index)
                      {
                        return Column(
                          children: [
                            itemMaker(convList[index],iconList[index],Colors.pink[600]!,context,"temp"),
                            itemMaker(convList[index+1],iconList[index+1],Colors.red[100]!,context,"length"),
                            itemMaker(convList[index+2],iconList[index+2],Colors.greenAccent,context,'time'),
                          ],
                        );
                      }
                      ),
              ),
            );
  }

}

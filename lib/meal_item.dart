import 'package:flutter/material.dart';
import 'package:tastynav_cuisines/model/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get complexityText{
    if(complexity == Complexity.Simple) return 'Simple';
    if(complexity == Complexity.Challenging) return 'Challenging';
    if(complexity == Complexity.Hard) return 'Hard';

    return 'Unknown';
  }

  String get affordabilityText {
    if(affordability == Affordability.Affordable) return 'Affordable';
    if(affordability == Affordability.Pricey) return 'Pricey';
    if(affordability == Affordability.Luxurious) return 'Luxurious';

    return 'Not Known';
  }

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // Positioned widget works only inside Stack widget
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 300,
                    child: Text(
                      title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(width: 4),
                        Text('$duration min'),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(width: 4),
                        Text(complexityText),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(width: 2),
                        Text(affordabilityText),
                      ],
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

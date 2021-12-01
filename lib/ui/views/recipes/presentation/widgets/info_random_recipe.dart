import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:recipe_app/ui/views/recipes/data/models/recipes_model.dart';

class InfoRandomRecipe extends StatelessWidget {
  final RecipeModel model;
  const InfoRandomRecipe({ 
    Key? key,
    required this.model 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(model.image),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 35,
            horizontal: 20
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cabin'
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                'Ready in ${model.readyInMinutes} minutes',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Cabin',
                  color: Colors.grey[400]
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cabin'
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 100,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20)
                      ),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30,
                        ),
                        Text(
                          '${model.aggregateLikes}',
                          style: const TextStyle(
                            fontSize: 18
                          ),
                        )
                      ],
                    )
                  )
                ],
              ),
              const SizedBox(height: 17,),
              Html(
                data: model.instructions != ""
                  ? model.instructions
                  : 'No instructions defined!',
              ),
            ],
          )
        )
      ]
    );
  }
}
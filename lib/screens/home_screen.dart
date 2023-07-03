import 'package:flutter/material.dart';
import 'package:savory/screens/recipe_details_screen.dart';

import '../api/recipe_api.dart';
import '../components/recipe_card.dart';
import '../services/recipe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Recipe> recipes;
  late List<Recipe> tags;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    recipes = await RecipeApi.getRecipe("15");
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Discover',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'The delights of savory cuisine!',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: const NetworkImage(
                        "https://cdn.iconscout.com/icon/free/png-256/free-user-avatar-contact-portfolio-personal-portrait-profile-5093.png?f=webp",
                        scale: 10),
                  )
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular recipes",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_alt_rounded,
                    color: Colors.grey.shade500,
                  ),
                ],
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: recipes.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print(recipes[index].preparationSteps);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RecipeDetails(
                                            cooktime: recipes[index].totalTime,
                                            name: recipes[index].name,
                                            ratings: recipes[index]
                                                .rating
                                                .toString(),
                                            thumbnail: recipes[index].images,
                                            numberOfServing: recipes[index]
                                                .numberOfServings
                                                .toString(),
                                            preparationSteps:
                                                recipes[index].preparationSteps,
                                            description:
                                                recipes[index].description,
                                          )));
                                },
                                child: RecipeCard(
                                  title: recipes[index].name,
                                  cookTime: recipes[index].totalTime,
                                  rating: recipes[index].rating.toString(),
                                  thumbnailUrl: recipes[index].images,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

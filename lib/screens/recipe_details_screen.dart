import 'package:flutter/material.dart';
import 'package:savory/components/recipe_card.dart';

class RecipeDetails extends StatelessWidget {
  final String thumbnail;
  final String name;
  final String cooktime;
  final String ratings;
  final String? description;
  final List<String> preparationSteps;
  const RecipeDetails(
      {super.key,
      required this.thumbnail,
      required this.name,
      required this.cooktime,
      required this.ratings,
      required this.preparationSteps,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final String slicedCooktime = cooktime.substring(0, 2);
    final String slicedCooktime1 = cooktime.substring(cooktime.length ~/ 2);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      offset: const Offset(0.0, 10.0),
                      blurRadius: 10.0,
                      spreadRadius: -6.0,
                    )
                  ],
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.10), BlendMode.multiply),
                      image: NetworkImage(thumbnail),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  constantReviewTimeRatings(Icons.star, ratings, "Ratings"),
                  constantReviewTimeRatings(
                      Icons.schedule, slicedCooktime, slicedCooktime1),
                  constantReviewTimeRatings(
                      Icons.filter_drama_sharp, "230", "Calories"),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Description",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                description ?? 'No description available',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Preparation steps",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: List.generate(preparationSteps.length, (index) {
                    return ListTile(
                      leading: Text(
                        '${index + 1}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      title: Text(
                        preparationSteps[index],
                        style: const TextStyle(fontSize: 15),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Row constantReviewTimeRatings(IconData icon, String number, String review) {
    return Row(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: Colors.pink.shade300,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            size: 35,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(number),
            Text(review),
          ],
        )
      ],
    );
  }

  _test1(String thumbnail) {
    return const Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Text('Points of interest',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black))),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                RecipeCard(
                  title: 'My recipe',
                  rating: '4.9',
                  cookTime: '30 min',
                  thumbnailUrl:
                      'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
                ),
                SizedBox(
                  width: 10,
                ),
                RecipeCard(
                  title: 'My recipe',
                  rating: '4.9',
                  cookTime: '30 min',
                  thumbnailUrl:
                      'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
                ),
                SizedBox(
                  width: 10,
                ),
                RecipeCard(
                  title: 'My recipe',
                  rating: '4.9',
                  cookTime: '30 min',
                  thumbnailUrl:
                      'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

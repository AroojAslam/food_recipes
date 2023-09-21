import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/Categories.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<Categories>> fetchCategories() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> categoriesData = jsonData['categories'];
      return categoriesData.map((category) => Categories.fromJson(category)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child:
            FutureBuilder<List<Categories>>(
              future: fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final categories = snapshot.data;

                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories!.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return  Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Column(
                            children: [
                            Image(
                                height: 100,
                                width: 100,

                                image: NetworkImage(category.strCategoryThumb)),
                              Text(category.strCategory),

                            ],
                          ),
                        );


                      },
                    ),
                  );
                }
              },
            )

            )
          ],
        ),
      ),
    );
  }
}

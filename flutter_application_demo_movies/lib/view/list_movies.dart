import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/movies_controller.dart';
import '../models/movies_model.dart';
import 'movie_item.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final MoviesController controller = Get.put(MoviesController());
  RxList<Results> movies = <Results>[].obs;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final response = await controller.getPopular();
    if (response != null && response.results != null) {
      movies.value = response.results!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies List')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.value.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        }
        return RefreshIndicator(
          onRefresh: fetchMovies,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: MovieItem(movie: movie),
              );
            },
          ),
        );
      }),
    );
  }
}

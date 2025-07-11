import 'package:flutter_application_demo_movies/models/movies_model.dart';
import 'package:get/state_manager.dart';

import '../service/movie_api.dart';

class MoviesController extends GetxController {
  var error = "".obs;
  var isLoading = false.obs;

  final MovieRepository repository = MovieRepository();

  void showLoading() {
    isLoading.value = true;
  }

  void hideLoading() {
    isLoading.value = false;
  }

  Future<PopularMovie?> getPopular() async {
    error.value = "";
    try {
      showLoading();
      var moviesResponse = await repository.getPopular();
      hideLoading();
      if (moviesResponse != null) {
        //success
        return moviesResponse;
      } else {
        error.value = "error loading movies failed";
      }
    } catch (e) {
      hideLoading();
      error.value = "error loading movies failed";
    }
    return null;
  }
}

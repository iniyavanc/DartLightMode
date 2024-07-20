import 'package:get/get.dart';
import 'package:quantzi/Routes/AppRoutes.dart';
import '../ApiConnect.dart';
import '../Component/MenuProvider.dart';
import '../ResponseModel/MoviesListResponse.dart';

class HomeScreenController extends GetxController {
  late MenuProvider userDataProvider;
  ApiConnect _connect = Get.put(ApiConnect());
  RxBool isLoading = RxBool(false);
  RxList<Results> moviesData = RxList();
  @override
  void onInit() {
    getMovies();
    super.onInit();
  }

  getMovies() async {
    isLoading.value = true;
    var response = await _connect.getMovieCall();
    isLoading.value = false;
    print('getMovies:${response.toJson()}');
    if (response != null) {
      moviesData.value = response.results!;
      // Get.offNamed(AppRoutes.login.toName);
    } else {}
  }
}

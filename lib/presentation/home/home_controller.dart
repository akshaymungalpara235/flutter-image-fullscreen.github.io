import 'package:get/get.dart';

/// Controller for managing the home page state.
/// Handles image URL state and context menu visibility.
class HomeController extends GetxController {
  /// Observable variable to store the image URL.
  final RxString imageUrl = ''.obs;

  /// Observable variable to manage the state of the context menu.
  final RxBool isMenuOpen = false.obs;

  /// Observable variable to manage the isImageLoading. By default it will be
  /// false.
  final RxBool isImageLoading = false.obs;

  /// Toggles the context menu visibility.
  void toggleContextMenu() => isMenuOpen.toggle();

  /// Toggles the context menu visibility.
  void closeContextMenu() {
    if (isMenuOpen.value) {
      isMenuOpen.value = false;
    }
  }

  /// Sets the provided URL to the imageUrl variable.
  void setImageUrl(String url) => imageUrl.value = url;

  /// Set the isImageLoading based on the image state.
  void setImageLoading(bool isLoading) => isImageLoading.value = isLoading;
}

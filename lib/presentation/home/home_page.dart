import 'dart:ui' as ui;
import 'dart:html' as html;
import 'package:demo_project/presentation/home/home_controller.dart';
import 'package:demo_project/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A stateless widget that represents the home page of the application.
/// It provides functionality to load and display images, handle full-screen mode,
/// and toggle a context menu.
class HomePage extends StatelessWidget {
  HomePage({super.key});

  /// Controller for managing user input of image URLs.
  final TextEditingController urlController = TextEditingController();

  /// Instance of [HomeController] for managing state.
  final _homeController = Get.put(HomeController());

  /// Unique identifier for the image view.
  String imageViewId = '';

  /// Toggles full-screen mode on and off.
  void toggleFullscreen() {
    final document = html.document.documentElement;
    if (html.document.fullscreenElement == null) {
      document?.requestFullscreen();
    } else {
      html.document.exitFullscreen();
    }
  }

  /// Registers an HTML image view with a unique ID and sets its properties.
  ///
  /// The image view is created dynamically and added to the Flutter widget tree.
  void registerImageView(String url) {
    final uniqueId = 'imageElement-${DateTime.now().millisecondsSinceEpoch}';

    final html.ImageElement imageElement = html.ImageElement()
      ..src = url
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.borderRadius = '12px';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry
        .registerViewFactory(uniqueId, (int viewId) => imageElement);

    imageViewId = uniqueId;
  }

  /// Loads an image from the provided URL and registers it for display.
  void loadImage() {
    _homeController.setImageUrl(urlController.text);
    registerImageView(_homeController.imageUrl.value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _homeController.closeContextMenu,
      child: Scaffold(
        appBar: AppBar(title: const Text(AppStrings.flutterWebTask)),
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 100, horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(_handleImageView),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: urlController,
                            decoration: const InputDecoration(
                              hintText: AppStrings.imageUrl,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: loadImage,
                          child: const Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Obx(_handleContextMenu),
          ],
        ),
        floatingActionButton: _handlePlusFAB(),
      ),
    );
  }

  /// Widget to handle the display of an image inside a container.
  Widget _handleImageView() {
    return Expanded(
      child: GestureDetector(
        onDoubleTap: toggleFullscreen,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: _homeController.imageUrl.isNotEmpty
                ? HtmlElementView(viewType: imageViewId)
                : const Center(
              child: Text(AppStrings.enterAnImageUrl),
            ),
          ),
        ),
      ),
    );
  }

  /// Floating action button to toggle the context menu.
  Widget _handlePlusFAB() {
    return FloatingActionButton(
      onPressed: _homeController.toggleContextMenu,
      child: const Icon(Icons.add),
    );
  }

  /// Widget to handle the display and actions of the context menu.
  Widget _handleContextMenu() {
    if (!_homeController.isMenuOpen.value) return const SizedBox();
    return Stack(
      children: [
        Positioned.fill(child: Container(color: Colors.black54)),
        Positioned(
          bottom: 80,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      toggleFullscreen();
                      _homeController.toggleContextMenu();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(AppStrings.enterFullScreen),
                    ),
                  ),
                  Divider(height: 1, color: Colors.grey.shade800),
                  GestureDetector(
                    onTap: () {
                      html.document.exitFullscreen();
                      _homeController.toggleContextMenu();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(AppStrings.exitFullScreen),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

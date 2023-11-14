import 'package:flix_movie/presentation/extensions/build_context_extension.dart';
import 'package:flix_movie/presentation/pages/movie_page/movie_page.dart';
import 'package:flix_movie/presentation/pages/profile_page/profile_page.dart';
import 'package:flix_movie/presentation/providers/router/router_provider.dart';
import 'package:flix_movie/presentation/providers/user_data/user_data_provider.dart';
import 'package:flix_movie/presentation/widgets/bottom_nav_bar.dart';
import 'package:flix_movie/presentation/widgets/bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  PageController pageController = PageController();
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (previous != null && next is AsyncData && next.value == null) {
          ref.read(routerProvider).goNamed('login');
        } else if (next is AsyncError) {
          context.showSnacBar(next.error.toString());
        }
      },
    );

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                selectedPage = value;
              });
            },
            children: [
              Center(
                child: MoviePage(),
              ),
              const Center(
                child: Text('Tela caso tivesse o bilhete comprado'),
              ),
              const Center(
                child: ProfilePage(),
              )
            ],
          ),
          BottomNavBar(
              items: [
                BottomNavBarItem(
                    index: 0,
                    isSelected: selectedPage == 0,
                    title: 'Inicio',
                    image: 'assets/movie.png',
                    selectedImage: 'assets/movie-selected.png'),
                BottomNavBarItem(
                    index: 2,
                    isSelected: selectedPage == 2,
                    title: 'Perfil',
                    image: 'assets/profile.png',
                    selectedImage: 'assets/profile-selected.png')
              ],
              onTap: (index) {
                selectedPage = index;

                pageController.animateToPage(selectedPage,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
              },
              selectedIndex: 0)
        ],
      ),
    );
  }
}

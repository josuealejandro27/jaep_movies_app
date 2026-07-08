import 'package:flutter/material.dart';
import 'package:jaep_movies_app/presentation/views/views.dart';
import 'package:jaep_movies_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  final int pageIndex;

  const HomeScreen({
    super.key,
    required this.pageIndex
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {

  late PageController pageController;

  @override
  void initState() {
    super.initState();  
    pageController = PageController(
      keepPage: true
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final viewRoutes = <Widget> [
    HomeView(),
    PopularView(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if(pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeOut
      );
    }
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: widget.pageIndex
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
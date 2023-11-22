import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_theme.dart';
import 'package:groupchat_clean_architecture/features/presentation/pages/home/tabBarScreen/groups_screen.dart';
import 'package:groupchat_clean_architecture/features/presentation/pages/home/tabBarScreen/profile_screen.dart';
import 'package:groupchat_clean_architecture/features/presentation/pages/home/tabBarScreen/user_screen.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/customer_tab_bar.dart';

class HomeScreen extends StatefulWidget {

  final String uid;
  const HomeScreen({super.key, required this.uid});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageViewController = PageController();
  bool _isSearch = false;
  int _toolBarPageIndex = 0;
  final List<String> _popupMenuListItem = ['Logout', 'Profile'];

  List<Widget> get pages => [
        const GroupScreen(),
        const UserScreen(),
        const ProfileScreen(),
      ];

  @override
  void dispose() {
    _searchController.dispose();
    _pageViewController.dispose();
    super.dispose();
  }

  Widget _buildSearchWidget() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.only(top: 20),
      height: 60,
      decoration: BoxDecoration(color: AppColors.whiteColors, boxShadow: [
        BoxShadow(
          color: AppColors.blackColors.withOpacity(0.3),
          blurRadius: 2,
          spreadRadius: 1,
          offset: const Offset(0.0, 0.50),
        )
      ]),
      child: TextFormField(
          controller: _searchController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: InkWell(
                onTap: () {
                  setState(() {
                    _isSearch = !_isSearch;
                  });
                },
                child: const Icon(Icons.arrow_back),
              ))),
    );
  }

  Widget _emptyContainer() {
    return const SizedBox(height: 0, width: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: _isSearch ? 0 : 0,
        backgroundColor: _isSearch ? Colors.transparent : AppColors.greenColor,
        title: _isSearch ? _emptyContainer() : const Text("ChateApp"),
        flexibleSpace: _isSearch ? _buildSearchWidget() : _emptyContainer(),
        actions: _isSearch
            ? []
            : [
                InkWell(
                  onTap: () {
                    setState(() {
                      _isSearch = !_isSearch;
                      debugPrint(_isSearch.toString());
                    });
                  },
                  child: const Icon(Icons.search),
                ),
                const Gap(10),
                // InkWell(
                //   onTap: () {
                //   },
                //   child: Icon(Icons.more_vert),
                // ),
                PopupMenuButton(
                  itemBuilder: (_) => _popupMenuListItem
                      .map((e) => PopupMenuItem(child: Text(e)))
                      .toList(),
                ),
              ],
      ),
      body: Column(
        children: [
          _isSearch ? _emptyContainer() : CustomTabBar(
            toolbarIndexController: (index) {
              debugPrint('Current page $index');
              setState(() {
                _toolBarPageIndex = index;
              });
              _pageViewController.jumpToPage(index);
            },
            pageIndex: _toolBarPageIndex,
          ),

          /// Page View Builder
          Expanded(
            child: PageView.builder(
              controller: _pageViewController,
              onPageChanged: (index) {
                setState(() {
                  _toolBarPageIndex = index;
                });
              },
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          )
        ],
      ),
    );
  }
}

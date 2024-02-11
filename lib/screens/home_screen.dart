import 'package:flutter/material.dart';
import 'package:flutter_gui/widgets/home_bottom_bar.dart';
import 'package:flutter_gui/widgets/items_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);

    _tabController.addListener(_handleTabSelection);

    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.sort_rounded,
                        color: Colors.white.withOpacity(0.5),
                        size: 35
                      ),
                    ), 
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white.withOpacity(0.5),
                        size: 35
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30), 
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'It\'s a Great Day for a Coffee',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 30,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 50, 54, 56),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Find your coffee',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5)
                    ), 
                    prefixIcon: Icon(
                      Icons.search, 
                      size: 30,
                      color: Colors.white.withOpacity(0.5),
                    )
                  ),
                ),
              ), 
              TabBar(
                tabAlignment: TabAlignment.start,
                controller: _tabController, 
                labelColor: const Color(0xFFE57734),
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3, 
                    color: Color(0xFFE57734),
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 8),
                ),
                labelStyle: 
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                tabs: const [
                  Tab(text: 'Hot Coffee'),
                  Tab(text: 'Cold Coffee'),
                  Tab(text: 'Cappuccino'),
                  Tab(text: 'Americano'),
                ],
              ), 
              const SizedBox(height: 10), 
              Center(
                child: [
                  ItemsWidget(),
                  ItemsWidget(),
                  ItemsWidget(),
                  ItemsWidget()
                ][_tabController.index],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
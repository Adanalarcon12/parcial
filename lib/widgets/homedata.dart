import 'package:controldegastosapp/widgets/daylingtab.dart';
import 'package:controldegastosapp/widgets/graficoshome.dart';
import 'package:controldegastosapp/widgets/weekly.dart';
import 'package:flutter/material.dart';
import 'package:controldegastosapp/temas/apptemas.dart';


class HomeDataScreen extends StatefulWidget {
  const HomeDataScreen({super.key});

  @override
  State<HomeDataScreen> createState() => _HomeDataScreenState();
}

class _HomeDataScreenState extends State<HomeDataScreen> with SingleTickerProviderStateMixin{

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Diario'),
    Tab(text: 'Semanal'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
   _tabController.dispose();
   super.dispose();
 }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 100,
      ),
      decoration: BoxDecoration(
        color: AppTheme.background,    
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(60),
          topStart: Radius.circular(60),
          
        ),
        
      ),
      child:Scaffold(
        
         appBar: AppBar(
            bottom: TabBar(
              controller: _tabController,
              tabs: myTabs,
              unselectedLabelColor: AppTheme.primary,
              indicatorColor: AppTheme.primary,
              labelColor: AppTheme.secondary,
            ),
          ),
          body: TabBarView(
          controller: _tabController,
          children: [
            DailyTabScreen(),
            WeeklyScreen()
           
          ]
        ),
        ),
    );
  }
}
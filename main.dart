import 'package:flutter/material.dart';

void main() => runApp(const FoodLinkApp());

const green = Color(0xFF168653);
const paleGreen = Color(0xFFE7F4EC);

class FoodLinkApp extends StatelessWidget {
  const FoodLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FOODLINK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: green),
        scaffoldBackgroundColor: const Color(0xFFF6F8F6),
        appBarTheme: const AppBarTheme(
          backgroundColor: green,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      home: const FoodLinkHome(),
    );
  }
}

class FoodLinkHome extends StatefulWidget {
  const FoodLinkHome({super.key});

  @override
  State<FoodLinkHome> createState() => _FoodLinkHomeState();
}

class _FoodLinkHomeState extends State<FoodLinkHome> {
  int selectedTab = 0;

  final pages = const [
    DashboardPage(),
    DemandPage(),
    SurplusPage(),
    ReportsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final titles = ['FOODLINK', 'Demand prediction', 'Surplus food', 'Reports'];
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[selectedTab],
            style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.wifi_off_rounded),
          ),
        ],
      ),
      body: SafeArea(child: pages[selectedTab]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab,
        onDestinationSelected: (value) => setState(() => selectedTab = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.insights_outlined), selectedIcon: Icon(Icons.insights), label: 'Demand'),
          NavigationDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2), label: 'Surplus'),
          NavigationDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: 'Reports'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text('Less Waste. More Meals.',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
        const SizedBox(height: 5),
        Text('Campus food intelligence at a glance',
            style: TextStyle(color: Colors.grey.shade700)),
        const SizedBox(height: 20),
        const Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            MetricCard(title: 'Predicted demand', value: '200', unit: 'portions', icon: Icons.restaurant, color: Colors.blue),
            MetricCard(title: 'Potential surplus', value: '50', unit: 'portions', icon: Icons.inventory_2, color: Colors.orange),
            MetricCard(title: 'Food redistributed', value: '120', unit: 'portions', icon: Icons.volunteer_activism, color: green),
            MetricCard(title: 'Collection points', value: '3', unit: 'available', icon: Icons.location_on, color: Colors.purple),
          ],
        ),
        const SizedBox(height: 22),
        const Text("Today's workflow", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        const WorkflowTile(icon: Icons.insights, title: 'Predict demand', subtitle: 'Estimate portions using recent consumption.'),
        const WorkflowTile(icon: Icons.fact_check_outlined, title: 'Verify surplus', subtitle: 'An authorised operator confirms quantity and safety details.'),
        const WorkflowTile(icon: Icons.share_outlined, title: 'Match collection points', subtitle: 'Find locations with suitable capacity and time windows.'),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: paleGreen, borderRadius: BorderRadius.circular(16)),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.offline_bolt, color: green),
              SizedBox(width: 10),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Offline-first design', style: TextStyle(fontWeight: FontWeight.bold, color: green)),
                SizedBox(height: 4),
                Text('Core screens are designed to work with information stored on the device. This starter build uses sample data.'),
              ])),
            ],
          ),
        ),
        const SizedBox(height: 14),
        const Text('Food safety rule', style: TextStyle(fontWeight: FontWeight.bold)),
        const Text('A batch is eligible for redistribution only after an authorised operator verifies its food-safety information and handling window. Sensor readings alone never establish food safety.'),
      ],
    );
  }
}

class MetricCard extends StatelessWidget {
  final String title, value, unit;
  final IconData icon;
  final Color color;
  const MetricCard({super.key, required this.title, required this.value, required this.unit, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.sizeOf(context).width - 48) / 2,
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(icon, color: color, size: 27),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 27, fontWeight: FontWeight.w800)),
            Text(unit, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          ]),
        ),
      ),
    );
  }
}

class WorkflowTile extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  const WorkflowTile({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) => Card(
    elevation: 0,
    color: Colors.white,
    margin: const EdgeInsets.only(bottom: 9),
    child: ListTile(
      leading: CircleAvatar(backgroundColor: paleGreen, child: Icon(icon, color: green)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(subtitle),
    ),
  );
}

class DemandPage extends StatelessWidget {
  const DemandPage({super.key});
  @override
  Widget build(BuildContext context) => const InfoPage(
    icon: Icons.insights,
    title: 'Demand prediction',
    description: 'Enter recent consumption and the app will estimate how many portions to prepare. The first version will use a simple weighted average, not a cloud AI service.',
    detail: 'Sample forecast: 200 portions',
  );
}

class SurplusPage extends StatelessWidget {
  const SurplusPage({super.key});
  @override
  Widget build(BuildContext context) => const InfoPage(
    icon: Icons.inventory_2,
    title: 'Surplus food',
    description: 'Register a batch only after an operator physically verifies the quantity, preparation time, allergens and approved handling window.',
    detail: 'No sample batch is approved for redistribution.',
  );
}

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});
  @override
  Widget build(BuildContext context) => const InfoPage(
    icon: Icons.bar_chart,
    title: 'Reports',
    description: 'Track predicted versus actual demand, avoidable waste and portions successfully redistributed.',
    detail: 'Reports will use locally stored records.',
  );
}

class InfoPage extends StatelessWidget {
  final IconData icon;
  final String title, description, detail;
  const InfoPage({super.key, required this.icon, required this.title, required this.description, required this.detail});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(radius: 38, backgroundColor: paleGreen, child: Icon(icon, color: green, size: 38)),
        const SizedBox(height: 18),
        Text(title, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(description, textAlign: TextAlign.center, style: const TextStyle(height: 1.5)),
        const SizedBox(height: 18),
        Container(width: double.infinity, padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: paleGreen, borderRadius: BorderRadius.circular(12)),
          child: Text(detail, textAlign: TextAlign.center, style: const TextStyle(color: green, fontWeight: FontWeight.w700))),
      ]),
    ),
  );
}

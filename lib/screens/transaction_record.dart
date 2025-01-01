import 'package:flutter/material.dart';
import 'package:othego_project/screens/admin_dashboard.dart';
import 'package:othego_project/screens/admin_viewComplain.dart';
import 'package:othego_project/screens/customer_account.dart';
import 'package:othego_project/screens/review_rating_admin_screen.dart';
import 'package:othego_project/screens/roomlisting_screen.dart';
import 'package:othego_project/screens/transactionDetails.dart';

class TransactionRecordsPage extends StatefulWidget {
  const TransactionRecordsPage({super.key});

  @override
  _TransactionRecordsPageState createState() => _TransactionRecordsPageState();
}

class _TransactionRecordsPageState extends State<TransactionRecordsPage> {
  final List<Map<String, String>> transactions = [
    {
      'name': 'Kamal Adli',
      'date': '14.08.2024',
      'amount': 'RM550',
      'paymentMethod': 'Paid by Online Banking',
      'status': 'Paid',
    },
    {
      'name': 'Haymitch Ikle',
      'date': '02.08.2024',
      'amount': 'RM400',
      'paymentMethod': 'Paid by Cash',
      'status': 'Paid',
    },
    {
      'name': 'Leonardo Lee',
      'date': '01.08.2024',
      'amount': 'RM550',
      'paymentMethod': 'Paid by Cash',
      'status': 'Paid',
    },
    {
      'name': 'Aisyah Alni',
      'date': '14.05.2024',
      'amount': 'RM400',
      'paymentMethod': 'Paid by Online Banking',
      'status': 'Paid',
    },
    {
      'name': 'Intan Ladyana',
      'date': '02.02.2024',
      'amount': 'RM475',
      'paymentMethod': 'Paid by Online Banking',
      'status': 'Paid',
    },
  ];

  List<Map<String, String>> filteredTransactions = [];
  List<String> selectedMonths = [];
  List<String> selectedPaymentMethods = [];
  String selectedStatus = '';

  @override
  void initState() {
    super.initState();
    filteredTransactions = transactions;
  }

  void applyFilters() {
    setState(() {
      filteredTransactions = transactions.where((transaction) {
        final month = transaction['date']!.split('.')[1];
        final paymentMethod = transaction['paymentMethod']!;
        final status = transaction['status']!;

        final matchesMonth =
            selectedMonths.isEmpty || selectedMonths.contains(month);
        final matchesPaymentMethod = selectedPaymentMethods.isEmpty ||
            selectedPaymentMethods
                .any((method) => paymentMethod.contains(method));
        final matchesStatus =
            selectedStatus.isEmpty || status == selectedStatus;

        return matchesMonth && matchesPaymentMethod && matchesStatus;
      }).toList();
    });
  }

  void resetFilters() {
    setState(() {
      selectedMonths = [];
      selectedPaymentMethods = [];
      selectedStatus = '';
      filteredTransactions = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[300],
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Transaction Records',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),
          )
        ],
      ),
      drawer: Drawer(
        //SideBar
        child: Container(
          color: Colors.black, // Background color for sidebar
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            children: const [
              SidebarItem(
                title: 'Dashboard',
                destination: DashboardScreen(),
              ),
              SidebarItem(
                title: 'Room Listings',
                destination: RoomListingScreen(),
              ),
              SidebarItem(
                title: 'Customer Account',
                destination: CustomerAccount(),
              ),
              SidebarItem(
                title: 'Review & Rating',
                destination: ReviewRating(),
              ),
              SidebarItem(
                title: 'Transaction Records',
                destination: TransactionRecordsPage(),
              ),
              SidebarItem(
                title: 'Customer Complaint',
                destination: AdminViewComplain(),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.red[300],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search your records',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (query) {
                        setState(() {
                          filteredTransactions =
                              transactions.where((transaction) {
                            return transaction['name']!
                                .toLowerCase()
                                .contains(query.toLowerCase());
                          }).toList();
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    icon: const Icon(Icons.filter_alt, color: Colors.black),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => buildFilterDialog(),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredTransactions.length,
                itemBuilder: (context, index) {
                  final transaction = filteredTransactions[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(transaction['name']!),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Amount: ${transaction['amount']}'),
                            Text(transaction['paymentMethod']!),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(transaction['date']!,
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                transaction['status']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransactionDetailsPage(
                                transaction: transaction,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterDialog() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Filter by months:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Wrap(
            children: List.generate(12, (index) {
              final month = (index + 1).toString().padLeft(2, '0');
              return FilterChip(
                label: Text(month),
                selected: selectedMonths.contains(month),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      selectedMonths.add(month);
                    } else {
                      selectedMonths.remove(month);
                    }
                  });
                },
              );
            }),
          ),
          const SizedBox(height: 16),
          const Text('Filter by payment method:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Wrap(
            children: [
              'Cash',
              'Credit Card',
              'Debit Card',
              'e-Wallet',
              'Online Banking'
            ]
                .map((method) => FilterChip(
                      label: Text(method),
                      selected: selectedPaymentMethods.contains(method),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedPaymentMethods.add(method);
                          } else {
                            selectedPaymentMethods.remove(method);
                          }
                        });
                      },
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          const Text('Filter by status:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: ['Paid', 'Pending', 'Unpaid']
                .map((status) => Expanded(
                      child: RadioListTile<String>(
                        title: Text(status),
                        value: status,
                        groupValue: selectedStatus,
                        onChanged: (value) {
                          setState(() {
                            selectedStatus = value!;
                          });
                        },
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: resetFilters,
                child: const Text('Reset'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  applyFilters();
                },
                child: const Text('Apply'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final String title;
  final Widget destination;

  const SidebarItem({
    super.key,
    required this.title,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

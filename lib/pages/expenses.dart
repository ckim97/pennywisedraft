// import 'package:flutter/material.dart';

// class ExpensePage extends StatelessWidget {
//   const ExpensePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("E X P E N S E S")),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class ExpenseEntry {
//   String category;
//   double amount;

//   ExpenseEntry({required this.category, required this.amount});
// }

// class ExpensePage extends StatefulWidget {
//   @override
//   _ExpensePageState createState() => _ExpensePageState();
// }

// class _ExpensePageState extends State<ExpensePage> {
//   List<ExpenseEntry> expenses = [];
//   String selectedCategory = 'Savings';
//   TextEditingController amountController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('E X P E N S E S'),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildCategoryDropdown('Category', selectedCategory),
//               _buildAmountField('Amount', amountController),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   addExpense();
//                 },
//                 child: Text('Add Expense'),
//               ),
//               SizedBox(height: 20),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: expenses.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: ListTile(
//                         title: Text('Category: ${expenses[index].category}'),
//                         subtitle: Text('Amount: \$${expenses[index].amount.toString()}'),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryDropdown(String label, String selectedValue) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label),
//         SizedBox(height: 8),
//         DropdownButton<String>(
//           value: selectedCategory,
//           onChanged: (String? newValue) {
//             setState(() {
//               selectedCategory = newValue!;
//             });
//           },
//           items: ['Savings', 'Entertainment', 'Bills', 'Food']
//               .map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//         ),
//         SizedBox(height: 20),
//       ],
//     );
//   }

//   Widget _buildAmountField(String label, TextEditingController controller) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label),
//         SizedBox(height: 8),
//         TextFormField(
//           controller: controller,
//           keyboardType: TextInputType.number,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//           ),
//         ),
//         SizedBox(height: 20),
//       ],
//     );
//   }

//   void addExpense() {
//     double amount = double.tryParse(amountController.text) ?? 0.0;
//     if (amount > 0) {
//       setState(() {
//         expenses.add(ExpenseEntry(category: selectedCategory, amount: amount));
//         amountController.clear();
//       });
//     }
//   }
// }

import 'package:flutter/material.dart';

class ExpenseEntry {
  String category;
  String description;
  double amount;
  DateTime timestamp; // Added timestamp field

  ExpenseEntry({
    required this.category,
    required this.description,
    required this.amount,
    required this.timestamp,
  });
}

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  List<ExpenseEntry> expenses = [];
  String selectedCategory = 'Savings';
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('E X P E N S E S'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCategoryDropdown('Category', selectedCategory),
              _buildTextField('Description', descriptionController),
              _buildAmountField('Amount', amountController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  addExpense();
                },
                child: Text('Add Expense'),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('Category: ${expenses[index].category}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Description: ${expenses[index].description}'),
                            Text('Amount: \$${expenses[index].amount.toString()}'),
                            Text('Timestamp: ${expenses[index].timestamp.toLocal()}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown(String label, String selectedValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        DropdownButton<String>(
          value: selectedCategory,
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue!;
            });
          },
          items: ['Savings', 'Entertainment', 'Bills', 'Food']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildAmountField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  void addExpense() {
    double amount = double.tryParse(amountController.text) ?? 0.0;
    if (amount > 0) {
      setState(() {
        expenses.add(ExpenseEntry(
          category: selectedCategory,
          description: descriptionController.text,
          amount: amount,
          timestamp: DateTime.now(), // Added timestamp
        ));
        amountController.clear();
        descriptionController.clear();
      });
    }
  }
}

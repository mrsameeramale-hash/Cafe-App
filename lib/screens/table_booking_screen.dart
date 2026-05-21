import 'package:flutter/material.dart';

class TableBookingScreen extends StatefulWidget {
  const TableBookingScreen({super.key});

  @override
  State<TableBookingScreen> createState() => _TableBookingScreenState();
}

class _TableBookingScreenState extends State<TableBookingScreen> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final guestsController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff0C0F14),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Book a Table 🍽️"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Reserve Your Spot",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Book your table in advance",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 25),

              /// NAME
              TextFormField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),

                validator: (value) =>
                value!.isEmpty ? "Enter your name" : null,

                decoration: InputDecoration(
                  hintText: "Enter Name",
                  hintStyle: const TextStyle(color: Colors.grey),

                  prefixIcon: const Icon(Icons.person, color: Colors.grey),

                  filled: true,
                  fillColor: const Color(0xff141921),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// GUESTS
              TextFormField(
                controller: guestsController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),

                validator: (value) =>
                value!.isEmpty ? "Enter number of guests" : null,

                decoration: InputDecoration(
                  hintText: "Number of Guests",
                  hintStyle: const TextStyle(color: Colors.grey),

                  prefixIcon: const Icon(Icons.group, color: Colors.grey),

                  filled: true,
                  fillColor: const Color(0xff141921),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// DATE PICKER
              GestureDetector(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );

                  if (date != null) {
                    setState(() => selectedDate = date);
                  }
                },

                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xff141921),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.grey),
                      const SizedBox(width: 10),

                      Text(
                        selectedDate == null
                            ? "Select Date"
                            : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// TIME PICKER
              GestureDetector(
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (time != null) {
                    setState(() => selectedTime = time);
                  }
                },

                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xff141921),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.grey),
                      const SizedBox(width: 10),

                      Text(
                        selectedTime == null
                            ? "Select Time"
                            : selectedTime!.format(context),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                height: 60,

                child: ElevatedButton(
                  onPressed: () {

                    if (_formKey.currentState!.validate()
                        && selectedDate != null
                        && selectedTime != null) {

                      showDialog(
                        context: context,
                        builder: (context) {

                          return AlertDialog(
                            backgroundColor: const Color(0xff252A32),

                            title: const Text(
                              "Booking Confirmed 🎉",
                              style: TextStyle(color: Colors.white),
                            ),

                            content: const Text(
                              "Your table has been reserved successfully.",
                              style: TextStyle(color: Colors.white70),
                            ),

                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill all details"),
                        ),
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffC67C4E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  child: const Text(
                    "Book Table",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
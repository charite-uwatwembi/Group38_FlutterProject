import 'package:flutter/material.dart';
import 'package:baho_app/views/Appointments_view/appointments_view.dart';

class BookingFormPage extends StatefulWidget {
  final String doctorName;
  final String doctorImageUrl;

  const BookingFormPage(
      {Key? key, required this.doctorName, required this.doctorImageUrl})
      : super(key: key);

  @override
  _BookingFormPageState createState() => _BookingFormPageState();
}

class _BookingFormPageState extends State<BookingFormPage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _problemController = TextEditingController();

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
      });
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _selectedTime)
      setState(() {
        _selectedTime = pickedTime;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        title: Text(widget.doctorName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Select Appointment date',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(_selectedDate == null
                        ? 'Select date'
                        : "${_selectedDate!.toLocal()}".split(' ')[0]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Select Appointment Time',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () => _selectTime(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(_selectedTime == null
                        ? 'Select time'
                        : _selectedTime!.format(context)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Patient’s name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Patient’s full name',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Mobile Number',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _mobileController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter patient’s mobile number',
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your problem',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _problemController,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Write your problem in short',
                prefixIcon: Icon(Icons.description),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handling the appointment logic
                  final newAppointment = {
                    'name': widget.doctorName,
                    'time': _selectedTime != null
                        ? _selectedTime!.format(context)
                        : 'Time not selected',
                    'date': _selectedDate != null
                        ? _selectedDate!.toLocal().toString().split(' ')[0]
                        : 'Date not selected',
                    'imageUrl': widget.doctorImageUrl,
                  };

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AppointmentsView(newAppointment: newAppointment),
                    ),
                  );
                },
                child: Text('Confirm Appointment',
                    style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

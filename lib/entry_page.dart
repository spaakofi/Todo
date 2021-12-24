

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EntryPage extends StatelessWidget {
  EntryPage({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Create ToDo',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800)),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            TextFormField(
              controller: _titleController,
              maxLines: 1,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                  hintText: 'Please Enter Title',
                  labelText: 'Title',
                  labelStyle: TextStyle(
                      color: Color.fromRGBO(37, 43, 103, 1),
                      fontWeight: FontWeight.w600),
                  floatingLabelBehavior: FloatingLabelBehavior.never),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Title Felid is Requieed';
                }
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(37, 43, 103, 1))),
                    hintText: 'Please Enter Description',
                    labelText: 'Description',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(37, 43, 103, 1),
                        fontWeight: FontWeight.w600),
                    floatingLabelBehavior: FloatingLabelBehavior.never),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Description Felid is Requieed';
                  }
                }),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                      controller: _dateController,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        ).then((selectedDate) {
                          print(selectedDate);
                        final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
                        _dateController.text = _dateFormat.format(selectedDate!);
                          
                        });
                      },
                      maxLines: 1,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(37, 43, 103, 1))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(37, 43, 103, 1))),
                          hintText: 'Please Enter Date',
                          labelText: 'Date ',
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(37, 43, 103, 1),
                              fontWeight: FontWeight.w600),
                          floatingLabelBehavior: FloatingLabelBehavior.never),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Date Felid is Requieed';
                        }
                      }),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: TextFormField(
                      controller: _timeController,
                      maxLines: 1,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((selectedTime) {
                         
                          _timeController.text = selectedTime!.format(context);
                        });
                      },
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(37, 43, 103, 1))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(37, 43, 103, 1))),
                          hintText: 'Please Enter Time',
                          labelText: 'Time ',
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(37, 43, 103, 1),
                              fontWeight: FontWeight.w600),
                          floatingLabelBehavior: FloatingLabelBehavior.never),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Time Felid is Requieed';
                        }
                      }),
                )
              ],
            ),
            const SizedBox(height: 100),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(37, 43, 103, 1),
                    padding: const EdgeInsets.all(17)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // backed
                    print(_titleController.text);
                    print(_descriptionController.text);
                    print(_dateController.text+""+ _timeController.text);
                    print('Successful Completed');
                  } else {
                    print('InComplete');
                  }
                },
                child: const Text(
                  'Create',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

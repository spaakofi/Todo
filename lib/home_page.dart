import 'package:flutter/material.dart';
import 'package:to_do_app/entry_page.dart';
import 'package:to_do_app/utilities.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedItem = 'todo';

  final List<Map<String, dynamic>> _unCompletedData = [];

  final List<Map<String, dynamic>> _completedData = [];

  final List<Map<String, dynamic>> data = [
    {
      'title': 'Class',
      'description': 'Bilogy Lectures at NCB',
      'date_time': 'Yesterday',
      'status': true,
    },
    {
      'title': 'Swiming class',
      'description': 'Swminig Lectures atSport Complex',
      'date_time': 'Today',
      'status': true,
    },
    {
      'title': 'Class',
      'description': 'Mamalogy Class at CCB',
      'date_time': 'Tomorrow',
      'status': false,
    },
    {
      'title': 'Personal studies',
      'description': 'Group discussion at parade Grounds',
      'date_time': 'Thursday 12 Dec ',
      'status': false,
    },
    {
      'title': 'Traning',
      'description': 'Handball Traning',
      'date_time': 'Satrday 24th Dec ',
      'status': false,
    },
    {
      'title': 'Church',
      'description': 'Sunday church service at Great Hall',
      'date_time': 'Sunday 26th Dec ',
      'status': false,
    },
    {
      'title': 'Vaction',
      'description': 'Visiting Accra',
      'date_time': '27th Dec ',
      'status': false,
    },
    {
      'title': 'Hangout ',
      'description': 'Beach with friends ',
      'date_time': '1st Jan 2022',
      'status': false,
    }
  ];
  @override
  void initState() {
    for (var element in data) {
      if (!element['status']) {
        _unCompletedData.add(element);
      } else {
        _completedData.add(element);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
              icon: const Icon(Icons.menu),
              onSelected: (value) {
                setState(() {
                  selectedItem = value;
                });
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(child: Text('Todo'), value: 'todo'),
                  const PopupMenuItem(
                      child: Text('completed'), value: 'completed')
                ];
              }),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
        leading: const CircleAvatar(
          radius: 8,
          backgroundImage: AssetImage('assets/6.jpg'),
        ),
        title: const Text(
          'My Task',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return EntryPage();
          }));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(37, 43, 103, 1),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline_outlined,
                      size: 28,
                      color: customColor(
                          date: selectedItem == 'todo'
                              ? _unCompletedData[index]['date_time']
                              : _completedData[index]['date_time']),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                             selectedItem == 'todo'
                              ? _unCompletedData[index]['title']
                              : _completedData[index]['title'],
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color.fromRGBO(37, 43, 103, 1),
                            ),
                          ),
                          Text(
                            selectedItem == 'todo'
                              ? _unCompletedData[index]['description']
                              : _completedData[index]['description'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.notifications_outlined,
                            color: customColor(
                              date: selectedItem == 'todo' ? _unCompletedData[index]['date_time']
                              : _completedData[index]['date_time'])),
                        Text(
                           selectedItem == 'todo'
                              ? _unCompletedData[index]['date_time']
                              : _completedData[index]['date_time'],
                          style: TextStyle(
                              color: customColor(
                                  date: _unCompletedData[index]['date_time'])),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 12);
          },
          itemCount: selectedItem == 'todo'
              ? _unCompletedData.length
              : _completedData.length),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Material(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromRGBO(37, 43, 103, 1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_outline_outlined,
                      size: 28, color: Colors.white),
                  const SizedBox(width: 15),
                  const Text(
                    'Completed',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const Spacer(),
                  Text('${_completedData.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

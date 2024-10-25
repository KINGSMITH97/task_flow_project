import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flow_project/models/task.dart';
import 'package:task_flow_project/providers/task_provider.dart';
import 'package:task_flow_project/screens/analytics.dart';
import 'package:task_flow_project/widgets/task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Priority? _selectedPriority;
  String _searchQuery = "";
  bool _isGridView = false;

  List<Task> _filteredTask(List<Task> tasks) {
    return tasks.where((task) {
      final matchSearch = task.title
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          task.description.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchPriority =
          _selectedPriority == null || task.priority == _selectedPriority;
      return matchSearch && matchPriority;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchBar(),
          _buildFilterBar(),
          Expanded(
            child: Consumer<TaskProvider>(
              builder: (context, taskProvider, child) {
                final filteredTasks = _filteredTask(taskProvider.tasks);
                return _isGridView
                    ? _buildGridView(filteredTasks)
                    : _buildListView(filteredTasks);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildGridView(List<Task> task) {
    return task.isEmpty
        ? const Text("Empty")
        : GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: task.length,
            itemBuilder: (context, index) {
              return TaskCard(
                task: task[index],
                onTap: () {
                  _navigateToTaskDetails(task[index]);
                },
                isGridView: true,
              );
            },
          );
  }

  Widget _buildListView(List<Task> task) {
    return task.isEmpty
        ? const Text("Empty Task")
        : ListView.builder(
            itemCount: task.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TaskCard(
                  task: task[index],
                  onTap: () {
                    _navigateToTaskDetails(task[index]);
                  },
                ),
              );
            },
          );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Taskflow'),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              _isGridView = !_isGridView;
            });
          },
          icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnalyticsPage(),
                ));
          },
          icon: const Icon(Icons.analytics_outlined),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'search tasks',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildFilterBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          FilterChip(
            label: const Text("All"),
            selected: _selectedPriority == null,
            onSelected: (selected) {
              setState(() {
                _selectedPriority = null;
              });
            },
          ),
          const SizedBox(width: 8),
          ...Priority.values.map((item) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                  label: Text(item.name.toUpperCase()),
                  selected: _selectedPriority == item,
                  onSelected: (selected) {
                    setState(() {
                      _selectedPriority = selected ? item : null;
                    });
                  }),
            );
          })
        ],
      ),
    );
  }

  void _showAddTaskDialog() {
    String title = "";
    String description = "";
    Priority priority = Priority.low;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                onChanged: (value) {
                  description = value;
                },
                decoration: const InputDecoration(labelText: "description"),
              ),
              DropdownButton<Priority>(
                onChanged: (Priority? newPriority) {
                  if (newPriority != null) {
                    setState(
                      () {
                        priority = newPriority;
                      },
                    );
                  }
                },
                items: Priority.values
                    .map(
                      (item) => DropdownMenuItem<Priority>(
                        value: item,
                        child: Text(item.name),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final Task newTask = Task(
                  id: DateTime.now().toString(),
                  title: title,
                  description: description,
                  dueDate: DateTime.now(),
                  priority: priority,
                  tags: [],
                );
                Provider.of<TaskProvider>(context, listen: false)
                    .addTask(newTask);
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _navigateToTaskDetails(Task task) {}
}

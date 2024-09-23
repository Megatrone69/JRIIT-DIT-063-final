import 'dart:io';

class MoodEntry {
  String mood;
  String reflection;
  DateTime date;

  MoodEntry(this.mood, this.reflection) : date = DateTime.now();

  @override
  String toString() {
    return '${date.toLocal()} - Mood: $mood, Reflection: $reflection';
  }
}

class MentalHealthApp {
  List<MoodEntry> moodEntries = [];

  void logMood(String mood, String reflection) {
    moodEntries.add(MoodEntry(mood, reflection));
    print('Mood logged successfully!');
  }

  void viewMoodHistory() {
    if (moodEntries.isEmpty) {
      print('No mood entries available.');
      return;
    }

    print('Mood History:');
    for (var entry in moodEntries) {
      print(entry);
    }
  }
}

void main() {
  final app = MentalHealthApp();

  while (true) {
    print('\nWelcome to Mental Health Check-In!');
    print('1. Log Mood');
    print('2. View Mood History');
    print('3. Exit');
    stdout.write('Choose an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter your mood (e.g., Happy, Sad, Anxious): ');
        String? mood = stdin.readLineSync();
        stdout.write('Write a reflection or note: ');
        String? reflection = stdin.readLineSync();
        if (mood != null && reflection != null) {
          app.logMood(mood, reflection);
        }
        break;

      case '2':
        app.viewMoodHistory();
        break;

      case '3':
        print('Exiting...');
        return;

      default:
        print('Invalid option. Please try again.');
    }
  }
}

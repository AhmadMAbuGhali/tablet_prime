class Note {
  final int? id;
  final String title;
  final String description;

  Note({
     this.id,
    required this.title,
    required this.description,
  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['Id'],
      title: map['Title'],
      description: map['Description'],
    );
  }

  Map<String, dynamic> toMap({required bool excludeId}) {
    return {
      'Id': id,
      'Title': title,
      'Description': description,
    };
  }
}

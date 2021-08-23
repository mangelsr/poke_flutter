extension StringExtension on String {
  String toTitleCase() => "${this[0].toUpperCase()}${this.substring(1)}";
}

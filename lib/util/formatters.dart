// lib/utils/formatters.dart
import 'package:intl/intl.dart';

class Formatters {
  // Date & Time Formatters
  static final DateFormat _dateTimeFormat = DateFormat('dd MMM yyyy, hh:mm:ss a');
  static final DateFormat _timeFormat = DateFormat('hh:mm:ss a');
  static final DateFormat _dateFormat = DateFormat('dd MMM yyyy');
  static final DateFormat _relativeDateFormat = DateFormat('EEE, MMM d');
  
  static String formatDateTime(DateTime dateTime) {
    return _dateTimeFormat.format(dateTime);
  }
  
  static String formatTime(DateTime dateTime) {
    return _timeFormat.format(dateTime);
  }
  
  static String formatDate(DateTime dateTime) {
    return _dateFormat.format(dateTime);
  }
  
  static String formatRelativeDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays == 0) {
      return 'Today, ${formatTime(dateTime)}';
    } else if (difference.inDays == 1) {
      return 'Yesterday, ${formatTime(dateTime)}';
    } else if (difference.inDays < 7) {
      return _relativeDateFormat.format(dateTime);
    }
    return formatDateTime(dateTime);
  }
  
  // Number Formatters
  static String formatCounterValue(int value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    }
    return value.toString();
  }
  
  static String formatNumberWithCommas(int number) {
    return NumberFormat('#,##0').format(number);
  }
  
  // String Formatters
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
  
  static String truncateWithEllipsis(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }
  
  // Time Formatters
  static String formatDuration(Duration duration) {
    if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes.remainder(60)}m';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m ${duration.inSeconds.remainder(60)}s';
    }
    return '${duration.inSeconds}s';
  }
  
  // File Size Formatters
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}
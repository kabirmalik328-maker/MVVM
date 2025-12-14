class AppTexts {
  // App Strings
  static const String appName = 'MVVM Counter App';
  static const String appVersion = '1.0.0';
  
  // Screen Titles
  static const String counterScreenTitle = 'Counter App with API';
  
  // Button Labels
  static const String incrementButton = 'Increment';
  static const String decrementButton = 'Decrement';
  static const String resetButton = 'Reset';
  static const String resetCounter = 'Reset Counter';
  static const String save = 'Save';
  static const String cancel = 'Cancel';
  static const String close = 'Close';
  static const String gotIt = 'Got it!';
  static const String edit = 'Edit';
  static const String saveNote = 'Save Note';
  
  // Counter Display
  static const String currentCount = 'Current Count';
  static const String currentValue = 'Current Value';
  static const String positive = 'Positive';
  static const String negative = 'Negative';
  static const String digits = 'Digits';
  static const String value = 'Value';
  
  // Note Section
  static const String counterNote = 'COUNTER NOTE';
  static const String addNoteHint = 'Type your note here...';
  static const String tapToAddNote = 'Tap to add a note';
  static const String addNoteDescription = 'Add reminders or notes about this counter';
  static const String noNotes = 'No notes added. Tap to add.';
  static const String clearNote = 'Clear Note';
  static const String noteCleared = 'Note cleared';
  
  // Last Updated
  static const String lastUpdated = 'LAST UPDATED';
  static const String lastUpdatedShort = 'Last Updated';
  static const String updated = 'Updated';
  
  // Error Messages
  static const String failedToLoad = 'Failed to load counter data';
  static const String failedToSave = 'Failed to save counter';
  static const String failedToReset = 'Failed to reset counter';
  static const String counterLimitReached = 'Counter limit reached';
  static const String noteTooLong = 'Note must be less than 100 characters';
  
  // Success Messages
  static const String counterReset = 'Counter reset to zero';
  static const String noteSaved = 'Note saved';
  
  // Dialog Texts
  static const String resetConfirmationTitle = 'Reset Counter';
  static const String resetConfirmationContent = 'Are you sure you want to reset the counter to zero?';
  static const String appInfoTitle = 'App Information';
  static const String architectureTitle = 'MVVM Architecture';
  
  // App Info Dialog
  static const String architecture = 'MVVM Pattern';
  static const String stateManagement = 'Provider';
  static const String localStorage = 'SharedPreferences';
  static const String theme = 'Light/Dark Mode';
  
  static const List<String> features = [
    '✓ Counter with increment/decrement',
    '✓ Persistent storage',
    '✓ Note taking',
    '✓ Theme switching',
    '✓ Error handling',
    '✓ Loading states',
  ];
  
  // Architecture Info
  static const String modelTitle = 'MODEL';
  static const String modelSubtitle = 'Data Layer';
  static const String modelDescription = 'Contains business logic and data structures';
  
  static const String viewModelTitle = 'VIEWMODEL';
  static const String viewModelSubtitle = 'Logic Layer';
  static const String viewModelDescription = 'Handles business logic and state management';
  
  static const String viewTitle = 'VIEW';
  static const String viewSubtitle = 'UI Layer';
  static const String viewDescription = 'Displays data and handles user interactions';
  
  static const String dataFlow = 'Data Flow:';
  static const String dataFlowPath = 'View → ViewModel → Repository → Service → Storage';
  
  // Info Card
  static const String mvvmArchitecture = 'MVVM Architecture';
  static const String architectureDescription = 'This app follows the Model-View-ViewModel pattern with:\n'
      '• Provider for state management\n'
      '• SharedPreferences for local storage\n'
      '• Repository pattern for data abstraction\n'
      '• Service layer for external dependencies';
  
  // Quick Actions
  static const String quickActions = 'Quick Actions';
  static const String toggleTheme = 'Toggle Theme';
  static const String switchTheme = 'Switch between light and dark mode';
  static const String addTen = 'Add +10';
  static const String increaseByTen = 'Quickly increase counter by 10';
  static const String plusTen = '+10';
  
  // Stats
  static const String noteLength = 'Note Length';
  
  // Tooltips
  static const String switchToLightMode = 'Switch to light mode';
  static const String switchToDarkMode = 'Switch to dark mode';
  static const String appInfo = 'App Info';
  
  // Placeholders
  static const String typeNoteHere = 'Type your note...';
  static const String addNote = 'Add a note...';
  
  // Validation Messages
  static const String noteLengthValidation = 'Note must be less than 100 characters';
  
  // Analytics
  static const String counterIncremented = 'Counter incremented to';
  static const String counterDecremented = 'Counter decremented to';
  static const String counterResetLog = 'Counter reset';
  static const String appOpened = 'App opened';
  
  // Multiplier Buttons
  static const String plusFive = '+5';
  static const String minusFive = '-5';
  
  // API Buttons
  static const String apiButton = 'API';
  
  // Weather Texts
  static const String weatherTitle = 'Live Weather';
  static const String temperature = 'Temperature';
  static const String humidity = 'Humidity';
  static const String condition = 'Condition';
  static const String apiDataSource = 'Data from API example';
  static const String loadingWeather = 'Loading weather data...';
  static const String refreshWeather = 'Refresh Weather';
  static const String weatherUpdateFailed = 'Failed to refresh weather data';
  
  // Counter Buttons
  static const String decrementLabel = 'Decrement';
  static const String incrementLabel = 'Increment';
  
  // Search Texts - NEW
  static const String searchHint = 'Search counter, notes, weather...';
  static const String search = 'Search';
  static const String clearSearch = 'Clear Search';
  static const String searchResults = 'Search Results';
  static const String noResultsFound = 'No results found';
  static const String found = 'found';

  // static double spaceXXS;

  // static double get spaceXXS => null;
}
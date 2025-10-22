class LocationDetailsState {
  final bool loading;
  final Map<String, dynamic>? weather;
  final String? street;
  final String? error;

  const LocationDetailsState({
    this.loading = false,
    this.weather,
    this.street,
    this.error,
  });

  LocationDetailsState copyWith({
    bool? loading,
    Map<String, dynamic>? weather,
    String? street,
    String? error,
  }) {
    return LocationDetailsState(
      loading: loading ?? this.loading,
      weather: weather ?? this.weather,
      street: street ?? this.street,
      error: error,
    );
  }
}

const LocationDetailsInitial = LocationDetailsState();

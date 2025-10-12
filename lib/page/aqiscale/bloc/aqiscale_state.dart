class AQIScaleState {
  final bool loading;
  final Map<String, dynamic>? feed;
  final String? error;

  const AQIScaleState({this.loading = false, this.feed, this.error});

  AQIScaleState copyWith({
    bool? loading,
    Map<String, dynamic>? feed,
    String? error,
  }) {
    return AQIScaleState(
      loading: loading ?? this.loading,
      feed: feed ?? this.feed,
      error: error,
    );
  }
}

const AQIScaleInitial = AQIScaleState();

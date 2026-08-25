import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/location_repository.dart';
import 'location_state.dart';

export 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository repository;

  LocationCubit(this.repository) : super(const LocationState.initial());

  Future<void> loadLocation(String city, {bool forceRefresh = false}) async {
    // Chuẩn hóa tên tên thành phố, loại bỏ khoảng trắng thừa
    final normalizedCity = city.trim();
    //kiểm tra xem tp có rỗng hay không
    if (normalizedCity.isEmpty) return;
    // Kiểm tra xem người dùng có đang yêu cầu cùng một thành phố không
    final isSameCity =
        state.requestedCity?.toLowerCase() == normalizedCity.toLowerCase();

    // Dùng dữ liệu đang giữ nếu người dùng mở lại đúng thành phố cũ.
    if (!forceRefresh && isSameCity && state.details != null) return;

    // Cập nhật trạng thái để hiển thị loading indicator
    final previousDetails = isSameCity ? state.details : null;
    emit(
      LocationState.loading(
        requestedCity: normalizedCity,
        previousDetails: previousDetails,
      ),
    );

    try {
      final details = await repository.getLocationDetails(normalizedCity);
      emit(
        LocationState.success(details: details, requestedCity: normalizedCity),
      );
    } catch (error) {
      emit(
        LocationState.failure(
          previousDetails: previousDetails,
          requestedCity: normalizedCity,
          error: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }

  Future<void> refreshLocation() async {
    final city = state.requestedCity;
    if (city == null) return;
    await loadLocation(city, forceRefresh: true);
  }
}

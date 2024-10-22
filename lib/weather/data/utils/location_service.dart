import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  /// Get current location coordinates
  static Future<Position?> getCurrentLocation() async {
    
    try {
      await Geolocator.getCurrentPosition();
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw 'Location services are disabled';
      }

      // Check for location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Location permissions are denied';
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw 'Location permissions are permanently denied';
      }

      // Get current position
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }

  /// Get address from coordinates
  static Future<Address> getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isEmpty) {
        throw 'No address found';
      }

      Placemark place = placemarks.first;

      var rsult = {
        'city': place.locality ?? '',
        'country': place.country ?? '',
        'countryCode': place.isoCountryCode ?? '',
        'administrativeArea': place.administrativeArea ?? '', // State/Province
        'subLocality': place.subLocality ?? '', // District/Suburb
        'street': place.street ?? '',
        'postalCode': place.postalCode ?? '',
        'formatted': _formatAddress(place),
      };
      return Address(city: place.locality ?? '', country: place.country ?? '');
    } catch (e) {
      print('Error getting address: $e');
      return Address(city: 'Unknown', country: '');
    }
  }

  /// Format address in a readable way
  static String _formatAddress(Placemark place) {
    List<String> addressParts = [];

    if (place.locality?.isNotEmpty ?? false) {
      addressParts.add(place.locality!);
    }

    if (place.administrativeArea?.isNotEmpty ?? false) {
      addressParts.add(place.administrativeArea!);
    }

    if (place.country?.isNotEmpty ?? false) {
      addressParts.add(place.country!);
    }

    return addressParts.join(', ');
  }

  /// Check if coordinates are valid
  static bool isValidCoordinates(double? latitude, double? longitude) {
    if (latitude == null || longitude == null) return false;
    return latitude >= -90 &&
        latitude <= 90 &&
        longitude >= -180 &&
        longitude <= 180;
  }
}



class Address {
  final String city;
  final String country;

  Address({required this.city, required this.country});
}

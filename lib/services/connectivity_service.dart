import 'package:connectivity_plus/connectivity_plus.dart';
import '../../services/sync_service.dart';

class ConnectivityService {
  final _connectivity = Connectivity();
  final _syncService = SyncService();

  void listen() {
    _connectivity.onConnectivityChanged.listen((status) async {
      if (status != ConnectivityResult.none) {
        await _syncService.syncDowntime();
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _searchUsers = false;
  bool get searchUsers => _searchUsers;
  set searchUsers(bool _value) {
    _searchUsers = _value;
  }

  bool _TaskCompleted = false;
  bool get TaskCompleted => _TaskCompleted;
  set TaskCompleted(bool _value) {
    _TaskCompleted = _value;
  }

  String _placeHolderImage =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/clone-kanban-app-olnum5/assets/zv3gan6l3r5k/ef3-placeholder-image.jpg';
  String get placeHolderImage => _placeHolderImage;
  set placeHolderImage(String _value) {
    _placeHolderImage = _value;
  }

  DocumentReference? _defaultCommunity =
      FirebaseFirestore.instance.doc('/organizations/0cEcaBnTd1gpUKuPZRBo');
  DocumentReference? get defaultCommunity => _defaultCommunity;
  set defaultCommunity(DocumentReference? _value) {
    _defaultCommunity = _value;
  }

  String _defaultAvatar =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/clone-kanban-app-olnum5/assets/l8hthxe767im/Portrait_Placeholder.png';
  String get defaultAvatar => _defaultAvatar;
  set defaultAvatar(String _value) {
    _defaultAvatar = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

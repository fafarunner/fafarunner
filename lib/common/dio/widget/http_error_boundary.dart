import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_boilerplate/common/dio/code.dart';
import 'package:flutter_boilerplate/common/dio/event/http_error_event.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HttpErrorBoundary {
  Widget? _w;
  ErrorBoundaryOverlayEntry? overlayEntry;

  Widget? get w => _w;
  GlobalKey<_NetworkErrorAlertContainerState>? _key;

  GlobalKey<_NetworkErrorAlertContainerState>? get key => _key;

  factory HttpErrorBoundary() => _instance;
  static final HttpErrorBoundary _instance = HttpErrorBoundary._internal();

  HttpErrorBoundary._internal();

  static HttpErrorBoundary get instance => _instance;

  static bool get isShow => _instance.w != null;

  static TransitionBuilder init({
    TransitionBuilder? builder,
  }) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, _ErrorBoundary(child: child));
      } else {
        return _ErrorBoundary(child: child);
      }
    };
  }

  static Future<void> handleErrorEvent(HttpErrorEvent event) async {
    switch (event.code) {
      case Code.networkError:
      case Code.networkTimeout:
        _noNetworkHandler();
        break;
      default:
        _errorDefaultHandler(event);
    }
  }

  static _noNetworkHandler() {
    instance._show(
      title: 'Tips',
      content: 'Network error. Please check your network and restart the app.',
      onConfirm: () {},
    );
  }

  static _errorDefaultHandler(HttpErrorEvent event) {
    Fluttertoast.showToast(
        msg: 'Error Code: ${event.code}\nError Message: ${event.message}');
  }

  Future<void> _show({
    required String title,
    required String content,
    VoidCallback? onConfirm,
  }) async {
    _key = GlobalKey<_NetworkErrorAlertContainerState>();
    _w = NetworkErrorAlertContainer(
        title: title, content: content, onConfirm: onConfirm);
    _markNeedsBuild();
  }

  Future<void> _dismiss() async {
    _w = null;
    _key = null;
    _markNeedsBuild();
  }

  void _markNeedsBuild() {
    overlayEntry?.markNeedsBuild();
  }
}

class _ErrorBoundary extends StatefulWidget {
  final Widget? child;

  const _ErrorBoundary({Key? key, required this.child})
      : assert(child != null),
        super(key: key);

  @override
  State<_ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<_ErrorBoundary> {
  late ErrorBoundaryOverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = ErrorBoundaryOverlayEntry(
      builder: (BuildContext context) =>
          HttpErrorBoundary.instance.w ?? Container(),
    );
    HttpErrorBoundary.instance.overlayEntry = _overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Overlay(
      initialEntries: [
        ErrorBoundaryOverlayEntry(builder: (BuildContext context) {
          if (widget.child != null) {
            return widget.child!;
          } else {
            return Container();
          }
        }),
        _overlayEntry,
      ],
    ));
  }
}

class ErrorBoundaryOverlayEntry extends OverlayEntry {
  @override
  // ignore: overridden_fields
  final WidgetBuilder builder;

  ErrorBoundaryOverlayEntry({
    required this.builder,
  }) : super(builder: builder);

  @override
  void markNeedsBuild() {
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        super.markNeedsBuild();
      });
    } else {
      super.markNeedsBuild();
    }
  }
}

class NetworkErrorAlertContainer extends StatefulWidget {
  const NetworkErrorAlertContainer({
    Key? key,
    required this.title,
    required this.content,
    this.onConfirm,
  }) : super(key: key);
  final String title;
  final String content;
  final VoidCallback? onConfirm;

  @override
  State<NetworkErrorAlertContainer> createState() =>
      _NetworkErrorAlertContainerState();
}

class _NetworkErrorAlertContainerState
    extends State<NetworkErrorAlertContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.8),
      child: Center(
        child: FittedBox(
          child: Container(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Tips',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextButton(
                    child: const Text('Confirm'),
                    onPressed: () {
                      if (widget.onConfirm != null) {
                        widget.onConfirm!();
                      }
                      HttpErrorBoundary._instance._dismiss();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

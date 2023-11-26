import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CannerApp extends StatefulWidget {
  @override
  _CannerApp createState() => _CannerApp();
}

class _CannerApp extends State<CannerApp> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  CameraFacing cameraFacing = CameraFacing.back;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('QR Scanner'),
          actions: [
            IconButton(
              icon: Icon(Icons.switch_camera),
              onPressed: _toggleCamera,
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 250,
                ),
                cameraFacing: cameraFacing,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: (result != null)
                    ? Text('Data: ${result!.code}')
                    : Text('Scan a QR code'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _toggleCamera() {
    if (cameraFacing == CameraFacing.back) {
      cameraFacing = CameraFacing.front;
    } else {
      cameraFacing = CameraFacing.back;
    }
    controller?.flipCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class CameraControllerManager {
  CameraFacing _cameraFacing = CameraFacing.back;

  CameraFacing get cameraFacing => _cameraFacing;

  void toggleCamera() {
    _cameraFacing = _cameraFacing == CameraFacing.back
        ? CameraFacing.front
        : CameraFacing.back;
  }
}

class QRDataProcessor {
  String processData(Barcode? barcode) {
    return barcode?.code ?? 'No Data';
  }
}

import 'package:flutter_danelya9/presentation/screen/qr_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  group('CameraControllerManager Tests', () {
    test('should toggle camera facing', () {
      final manager = CameraControllerManager();
      expect(manager.cameraFacing, CameraFacing.back);

      manager.toggleCamera();
      expect(manager.cameraFacing, CameraFacing.front);

      manager.toggleCamera();
      expect(manager.cameraFacing, CameraFacing.back);
    });
  });

  group('QRDataProcessor Tests', () {
    test('should return correct data from barcode', () {
      final processor = QRDataProcessor();
      final barcode = Barcode('Test Data', BarcodeFormat.qrcode, []);
      expect(processor.processData(barcode), 'Test Data');
    });

    test('should return "No Data" when barcode is null', () {
      final processor = QRDataProcessor();
      expect(processor.processData(null), 'No Data');
    });
  });
}

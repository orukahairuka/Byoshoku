import UIKit
import Photos
import AVFoundation

class AudioViewController: UIViewController {

    let photoView:UIImageView! = UIImageView() // カメラ画面用
    let codeLabel:UILabel! = UILabel()         // 読取結果表示用

    // MARK: - AVFoundation
    var avSession: AVCaptureSession!
    var avInput: AVCaptureDeviceInput!
    var avOutput: AVCapturePhotoOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        photoView.frame = CGRect(x: 0 ,y:0, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
        self.view.addSubview(photoView)

        if allowedStatus() {
            setupAVCapture()
        }
    }

    // MARK: - 承認状態識別 カメラ && フォトライブラリ
    func allowedStatus() -> Bool{
        if AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            return true
        }else{
            return false
        }
    }

    func setupAVCapture() {

        self.avSession = AVCaptureSession()
        guard let videoDevice = AVCaptureDevice.default(for: .video) else { return }

        do {

            let deviceInput = try AVCaptureDeviceInput(device: videoDevice)

            if self.avSession.canAddInput(deviceInput) {
                self.avSession.addInput(deviceInput)
                self.avInput = deviceInput


                // バーコード読取用Outputの指定
                let metadataOutput = AVCaptureMetadataOutput()
                if self.avSession.canAddOutput(metadataOutput) {
                    self.avSession.addOutput(metadataOutput)

                    metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                    // バーコードの種類を指定
                    metadataOutput.metadataObjectTypes = [.ean13]

                    // 読取エリアの設定
                    let x: CGFloat = 0.1
                    let y: CGFloat = 0.4
                    let width: CGFloat = 0.8
                    let height: CGFloat = 0.2
                    metadataOutput.rectOfInterest = CGRect(x: y, y: 1 - x - width, width: height, height: width)

                    let previewLayer = AVCaptureVideoPreviewLayer(session: self.avSession)
                    previewLayer.frame = self.photoView.bounds
                    previewLayer.videoGravity = .resizeAspectFill
                    self.view.layer.addSublayer(previewLayer)

                    // 読取エリアを可視化
                    let readingArea = UIView()
                    readingArea.frame = CGRect(x: view.frame.size.width * x, y: view.frame.size.height * y, width: view.frame.size.width * width, height: view.frame.size.height * height)
                    readingArea.layer.borderWidth = 2
                    readingArea.layer.borderColor = UIColor.orange.cgColor
                    view.addSubview(readingArea)

                    // 結果表示
                    codeLabel.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 120, width: UIScreen.main.bounds.width, height: 60)
                    codeLabel.backgroundColor = UIColor.gray
                    codeLabel.textAlignment = .center
                    codeLabel.text = "placeholder"
                    self.view.addSubview(codeLabel)

                    self.avSession.startRunning()
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension AudioViewController:AVCaptureMetadataOutputObjectsDelegate{
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        for metadata in metadataObjects as! [AVMetadataMachineReadableCodeObject] {

            if metadata.stringValue == nil { continue }

            codeLabel.text = metadata.stringValue!

            print(metadata.type)
            print(metadata.stringValue!)
        }
    }
}

import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow, NSWindowDelegate {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let screenFrame = NSScreen.main?.frame ?? CGRect(x: 0, y: 0, width: 1440, height: 900) // 获取屏幕大小
    let windowSize = CGSize(width: 1280, height: 720) // 设定窗口大小

    // 计算窗口居中位置
    let centerX = (screenFrame.width - windowSize.width) / 2
    let centerY = (screenFrame.height - windowSize.height) / 2
    // let windowFrame = self.frame
    let windowFrame = CGRect(x: centerX, y: centerY, width: windowSize.width, height: windowSize.height)
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}

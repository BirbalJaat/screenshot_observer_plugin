import Flutter
import UIKit

public class SwiftScreenshotObserverPlugin: NSObject, FlutterPlugin {

 static var channel: FlutterMethodChannel?

  static var observer: NSObjectProtocol?;
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "screenshot_observer_plugin",
    binaryMessenger: registrar.messenger())
      observer = nil;
    let instance = SwiftScreenshotObserverPlugin()
      if let channel = channel {
              registrar.addMethodCallDelegate(instance, channel: channel)
            }
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == "initialize"){
           if(SwiftScreenshotCallbackPlugin.observer != nil) {
               NotificationCenter.default.removeObserver(SwiftScreenshotCallbackPlugin.observer!);
               SwiftScreenshotCallbackPlugin.observer = nil;
           }
           SwiftScreenshotCallbackPlugin.observer = NotificationCenter.default.addObserver(
             forName: NSNotification.Name.UIApplicationUserDidTakeScreenshot,
             object: nil,
             queue: .main) { notification in
             if let channel = SwiftScreenshotCallbackPlugin.channel {
               channel.invokeMethod("onCallback", arguments: nil)
             }

             result("screen shot called")
         }
         result("initialize")
       }else if(call.method == "dispose"){
           if(SwiftScreenshotCallbackPlugin.observer != nil) {
               NotificationCenter.default.removeObserver(SwiftScreenshotCallbackPlugin.observer!);
               SwiftScreenshotCallbackPlugin.observer = nil;
           }
           result("dispose")
       }else{
         result("")
       }
  }

  deinit {
      if(SwiftScreenshotCallbackPlugin.observer != nil) {
          NotificationCenter.default.removeObserver(SwiftScreenshotCallbackPlugin.observer!);
          SwiftScreenshotCallbackPlugin.observer = nil;
      }
  }


}

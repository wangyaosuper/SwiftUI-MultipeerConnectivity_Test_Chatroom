# iOS上使用崩溃
初始化MCNearbyServiceAdvertiser时挂掉， 老是crash
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(
          peer: myPeerID,
          discoveryInfo: nil,
          serviceType: JobConnectionManager.service);

proceeding on the assumption it is not translocated: Error Domain=NSPOSIXErrorDomain Code=1 "Operation not permitted"


可能几个原因：
1. macOS 和 iOS 应用上Project 设置 Capability， 把网络相关的给加上
2. MCNearbyServiceAdvertiser 中传入的 SerivceType 不能带有下划线，必须只有26字母、数字、连接线



# iOS上没有办法Advertise Service, isRecevingJob状态切换时，总报错
2022-08-21 15:38:46.388342+0800 Network_Test2[39920:2488509] [MCNearbyServiceAdvertiser] Server did not publish: errorDict [{
    NSNetServicesErrorCode = "-72008";
    NSNetServicesErrorDomain = 10;
}].


原因：
需要在Info.plist 中增加两个字段
1.Key为：
NSBonjourServices
值为Array，两个String，String的Value分别为：
_network-test2._tcp
_network-test2._udp

注意前面必须有下划线

2.Key为:
Privacy - Local Network Usage Description
Value为String:Job Manager needs to use your phone's data to discover devices nearby

# iOS上使用崩溃
初始化MCNearbyServiceAdvertiser时挂掉， 老是crash
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(
          peer: myPeerID,
          discoveryInfo: nil,
          serviceType: JobConnectionManager.service);

proceeding on the assumption it is not translocated: Error Domain=NSPOSIXErrorDomain Code=1 "Operation not permitted"


可能几个原因：
1. macOS 应用上Project 设置 Capability， 把网络相关的给加上
2. MCNearbyServiceAdvertiser 中传入的 SerivceType 不能带有下划线，必须只有26字母、数字、连接线

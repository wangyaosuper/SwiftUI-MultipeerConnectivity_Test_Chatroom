//
//  JobConnectionManager.swift
//  Network_Test2
//
//  Created by York Wang on 2022/7/24.
//

import Foundation;
import MultipeerConnectivity

class JobConnectionManager: NSObject, ObservableObject{
    @Published var employees: [MCPeerID] = [];
    
    
    typealias JobReceivedHandler = (JobModel) -> Void;
    private let session: MCSession;
    private let myPeerID = MCPeerID(displayName: UIDevice.current.name);
    private let jobReceivedHandler : JobReceivedHandler?
    private static let service = "network_test2";
    private var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser;
    private var nearbyServiceBrowser: MCNearbyServiceBrowser;
    init(_ jobReceivedHandler:JobReceivedHandler? = nil){
        
        session = MCSession(
            peer: myPeerID,
            securityIdentity: nil,
            encryptionPreference: .none);
        
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(
          peer: myPeerID,
          discoveryInfo: nil,
          serviceType: JobConnectionManager.service);
        
        nearbyServiceBrowser = MCNearbyServiceBrowser(
            peer: myPeerID,
            serviceType: JobConnectionManager.service
        )
        
        self.jobReceivedHandler = jobReceivedHandler;

        super.init();
        session.delegate = self;
        nearbyServiceAdvertiser.delegate = self;
        nearbyServiceBrowser.delegate = self;
        
    }
    
    func startBrowsing(){
        nearbyServiceBrowser.startBrowsingForPeers();
    }
    
    func stopBrowsing(){
        nearbyServiceBrowser.stopBrowsingForPeers();
    }
    
    var isReceivingJobs: Bool = false {
        didSet {
            if isReceivingJobs {
                nearbyServiceAdvertiser.startAdvertisingPeer();
                print("Started Advertising.");
            } else {
                nearbyServiceAdvertiser.stopAdvertisingPeer();
                print("Stopped Advertising.")
            }
        }
    }
    
}

extension JobConnectionManager: MCNearbyServiceAdvertiserDelegate {
  func advertiser(
    _ advertiser: MCNearbyServiceAdvertiser,
    didReceiveInvitationFromPeer peerID: MCPeerID,
    withContext context: Data?,
    invitationHandler: @escaping (Bool, MCSession?) -> Void
  ) {
      guard
        let window = UIApplication.shared.windows.first,
        // 1
        let context = context,
        let jobName = String(data: context, encoding: .utf8)
      else {
        return
      }
      let title = "Accept \(peerID.displayName)'s Job"
      let message = "Would you like to accept: \(jobName)"
      let alertController = UIAlertController(title:title,
                                              message:message,
                                              preferredStyle: .alert);
      alertController.addAction(UIAlertAction(title:"No",
                                              style: .cancel){ _ in
          invitationHandler(false,nil)
          
      })
      alertController.addAction(UIAlertAction(title:"Yes",
                                              style:.default){_ in
          invitationHandler(true,nil)
          
      })
  }
}

extension JobConnectionManager: MCSessionDelegate{
    
}

extension JobConnectionManager: MCNearbyServiceBrowserDelegate{
    func browser(_ browser: MCNearbyServiceBrowser,
                 foundPeer peerID: MCPeerID,
                 withDiscoveryInfo info: [String: String]?){
        if(!employees.contains(peerID)){
            employees.append(peerID);
        }
    }

    func browser(_ browser: MCNearbyServiceBrowser,
                 lostPeer peerID: MCPeerID){
        guard
            let index = employees.firstIndex(of:peerID)
        else{
            return;
        }
            
        employees.remove(at: index);
        
    }
}


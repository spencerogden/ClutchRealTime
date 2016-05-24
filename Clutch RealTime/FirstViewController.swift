//
//  FirstViewController.swift
//  Clutch RealTime
//
//  Created by Spencer Ogden on 5/16/16.
//  Copyright © 2016 Clutch Performance. All rights reserved.
//

import UIKit
//import Cocoa
import CocoaAsyncSocket

class FirstViewController: UIViewController {
    var sock:AsyncUdpSocket?

    override func viewDidLoad() {
        super.viewDidLoad()
        if (sock == nil) {
            sock = AsyncUdpSocket(delegate: self)
        }
        
        do{
            try sock!.bindToPort(9000)
            //try sock.enableBroadcast(true)
            sock!.receiveWithTimeout(-1,tag: 0)
        } catch {
            print("error")
        }
        print("View Loaded and socket setup")
    }

    func onUdpSocket(thissock:AsyncUdpSocket!,
                     didReceiveData data: NSData,
                     withTag tag: CLong,
                     fromHost host:NSString,
                     port:UInt16){
        print(NSString(data: data, encoding: NSASCIIStringEncoding)!)
        thissock.receiveWithTimeout(-1, tag: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

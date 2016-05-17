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


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sock:AsyncUdpSocket = AsyncUdpSocket(delegate: self)
        do{
            try sock.bindToPort(54545)
            try sock.enableBroadcast(true)
            try sock.connectToHost("255.255.255.255", onPort: 54545)
            try sock.receiveWithTimeout(-1, tag: 0)
        } catch {
            print("error")
        }
        print("View Loaded and socket setup")
    }

    func udpSocket(sock:AsyncUdpSocket!,didReceiveData data: NSData!){
        print(data)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//
//  SocketService.swift
//  Smack
//
//  Created by Yaroslav Satsyuk on 11/13/17.
//  Copyright © 2017 Yaroslav Satsyuk. All rights reserved.
//

import Foundation
import SocketIO

class SocketService: NSObject {
    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL)!)
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String,
                let channelDesc = dataArray[1] as? String,
                let cnannelId = dataArray[2] as? String else {return}
            let newChannel = Channel(id: cnannelId, description: channelDesc, name: channelName)
            print("Id: \(newChannel.id) Desc: \(newChannel.description) Name: \(newChannel.name)")
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
}

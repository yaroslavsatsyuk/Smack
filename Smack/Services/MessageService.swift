//
//  MessageService.swift
//  Smack
//
//  Created by Yaroslav Satsyuk on 11/12/17.
//  Copyright © 2017 Yaroslav Satsyuk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static var instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER).responseJSON { (response) in
            if response.result.error != nil {
                if let data = response.data {
                    
                    do {
                        self.channels = try JSONDecoder().decode([Channel].self, from: data)
                    } catch let error {
                        debugPrint(error as Any)
                    }
                    print(self.channels)
//                    if let json = JSON(data).array {
//                        for item in json {
//                            let name = item["name"].stringValue
//                            let description = item["description"].stringValue
//                            let id = item["id"].stringValue
//                            let channel = Channel(title: name, description: description, id: id)
//                            self.channels.append(channel)
//                        }
//                         completion(true)
//                    }
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}

//
//  Channel.swift
//  Smack
//
//  Created by Yaroslav Satsyuk on 11/12/17.
//  Copyright © 2017 Yaroslav Satsyuk. All rights reserved.
//

import Foundation

struct Channel: Decodable {
    public private(set) var _id: String!
    public private(set) var description: String!
    public private(set) var name: String!
    public private(set) var __v: Int!
}

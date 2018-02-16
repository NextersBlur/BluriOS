//
//  ObserveRoomResult.swift
//  30DoC
//
//  Created by 주정한 on 2018. 2. 17..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

struct ObserveRoomResult {
    var offset : Int
    var chatVoiceList : [ChatVoice]
}

extension ObserveRoomResult {
    init?(dict : [String : Any]) {
        guard let offset = dict["offset"] as? Int,
            let chatVoiceDictList = dict["chatVoiceList"] as? [[String : Any]] else {
                return nil
        }
        
        self.offset = offset
        self.chatVoiceList = chatVoiceDictList.flatMap{ ChatVoice(dict: $0) }
    }
}

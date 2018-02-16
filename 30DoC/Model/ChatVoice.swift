//
//  ChatVoice.swift
//  30DoC
//
//  Created by 주정한 on 2018. 2. 17..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

struct ChatVoice {
    var filename : String
    var fileurl : String
    var regdate : String
    var registId : Int
    var roomId : Int
    var voiceId : Int
}

extension ChatVoice {
    init?(dict : [String : Any]){
        guard let filename = dict["filename"] as? String,
            let fileurl = dict["fileurl"] as? String,
            let regdate = dict["regdate"] as? String,
            let registId = dict["registId"] as? Int,
            let roomId = dict["roomId"] as? Int,
            let voiceId = dict["voiceId"] as? Int else {
                return nil
        }
        self.filename = filename
        self.fileurl = fileurl
        self.regdate = regdate
        self.registId = registId
        self.roomId = roomId
        self.voiceId = voiceId
    }
}

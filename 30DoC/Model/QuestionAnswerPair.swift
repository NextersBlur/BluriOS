//
//  QuestionAnswerPair.swift
//  30DoC
//
//  Created by 주정한 on 2018. 2. 17..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

struct QuestionAnswerPair {
    var question : String
    var answer : Bool
}

extension QuestionAnswerPair {
    init?(dict: [String : Any]) {
        guard let question = dict["question"] as? String,
            let answer = dict["answer"] as? Bool else {
                return nil
        }
        self.question = question
        self.answer = answer
    }
}

extension QuestionAnswerPair : JSONWritable {
    var jsonObject: [String : Any] {
        return ["question" : question,
                "answer" : answer
        ]
    }
}

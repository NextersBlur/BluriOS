//
//  RandomQuestionSet.swift
//  30DoC
//
//  Created by 주정한 on 2018. 2. 17..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

struct RandomQuestionSet {
    var memberId : Int
    var questionList : [QuestionAnswerPair]
}

extension RandomQuestionSet {
    init?(dict: [String : Any]) {
        guard let memberId = dict["memeberId"] as? Int,
            let quizList = dict["quizList"] as? [[String : Any]] else {
                return nil
        }
        
        self.memberId = memberId
        self.questionList = quizList.flatMap { QuestionAnswerPair(dict : $0) }
    }
}

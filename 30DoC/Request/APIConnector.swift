//
//  Request.swift
//  30DoC
//
//  Created by KAKAO on 2018. 1. 31..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import Foundation
import Alamofire

class APIConnector {
   
    private static var _instance : APIConnector?
    
    public static var shared : APIConnector {
        if _instance == nil {
            _instance = APIConnector()
        }
        return _instance!
    }
    
    let urlBase = "http://13.124.185.204:8080/api/v1/"
    
    private var isConnectedToInternet : Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    typealias MemberLoginResultCompletion = (Int?) -> Void //nil:fail, int>0 success
    
    func connectToMemberLogin(completion : @escaping MemberLoginResultCompletion) {
        guard isConnectedToInternet else {
            completion(nil)
            return
        }
        
        let params = [ "uniqueKey" : UserManager.shared.appId ]
        
        let request = Alamofire.request(urlBase + "member/login", method: .post, parameters: params)
        
        request.responseString { (response) in
            guard response.result.isSuccess else {
                completion(nil)
                return
            }
            
            guard let result = response.result.value,
                let intVal = Int(result) else {
                completion(nil)
                return
            }
            
            completion(intVal)
        }
    }
    
    typealias ObserveStatusResultCompletion = (String?) -> Void
    
    func connectToObserveStatus(completion : @escaping ObserveStatusResultCompletion) {
        guard isConnectedToInternet else {
            completion(nil)
            return
        }
        
        let params = [ "userId" : UserManager.shared.userId ]
        
        let request = Alamofire.request(urlBase + "member/observeStatus", method: .post, parameters: params)
        
        request.responseJSON { (response) in
            guard response.result.isSuccess else {
                completion(nil)
                return
            }
            
            guard let result = response.result.value as? [String : String],
                let status = result["status"] else {
                    completion(nil)
                    return
            }
            
            completion(status)
        }
    }
    
    typealias InquireQuizResultCompletion = ([QuestionAnswerPair]?) -> Void
    //get my quiz list
    func connectToInqureQuiz(completion : @escaping InquireQuizResultCompletion) {
        guard isConnectedToInternet else {
            completion(nil)
            return
        }
        
        let params = [ "userId" : UserManager.shared.userId ]
        
        let request = Alamofire.request(urlBase + "quiz/inquireQuiz", method: .post, parameters: params)
        
        request.responseJSON { (response) in
            guard response.result.isSuccess else {
                completion(nil)
                return
            }
            
            guard let result = response.result.value as? [[String : Any]] else {
                completion(nil)
                return
            }
            
            let questions = result.compactMap { QuestionAnswerPair(dict: $0) }
            completion(questions)
        }
    }
    
    typealias RandomQuizResultCompletion = (RandomQuestionSet?) -> Void

    func connectToRandomQuiz(completion : @escaping RandomQuizResultCompletion) {
        guard isConnectedToInternet else {
            completion(nil)
            return
        }
        
        let params = [ "userId" : UserManager.shared.userId ]
        
        let request = Alamofire.request(urlBase + "quiz/inquireQuiz", method: .post, parameters: params)
        
        request.responseJSON { (response) in
            guard response.result.isSuccess else {
                completion(nil)
                return
            }
            
            guard let result = response.result.value as? [String : Any] else {
                completion(nil)
                return
            }
            
            completion(RandomQuestionSet(dict: result))
        }
    }
    
    typealias SuccessFailCompletion = (Bool?) -> Void
    
    func connectToRegistQuiz(quizList : [QuestionAnswerPair],
                             completion : @escaping SuccessFailCompletion) {
        guard isConnectedToInternet else {
            completion(nil)
            return
        }
        
        let jsonQuizList = quizList.map{ $0.jsonObject }
        
        let url = URL(string: urlBase+"quiz/registQuiz?userId=\(UserManager.shared.userId)")
        
        let mutURLRequest = NSMutableURLRequest(url: url!)
        mutURLRequest.httpBody = try? JSONSerialization.data(withJSONObject: jsonQuizList, options: [])
        mutURLRequest.httpMethod = "POST"
        mutURLRequest.addValue("Content-Type", forHTTPHeaderField: "application/json")
        
        let request = Alamofire.request(mutURLRequest as! URLRequestConvertible)
        
        request.responseString { (response) in
            guard response.result.isSuccess else {
                completion(nil)
                return
            }
            
            guard let result = response.result.value else {
                    completion(nil)
                    return
            }
            
            let success = result == "success"
            
            completion(success)
        }
    }
    
    //TODO Submit??
    
    
    //chat room
    
    func connectToChoice(completion : @escaping (Bool) -> Void) {
        guard isConnectedToInternet else {
            completion(false)
            return
        }
        
        let params = [ "userId" : UserManager.shared.userId ]
        
        let request = Alamofire.request(urlBase + "chatRoom/choice", method: .post, parameters: params)
        
        request.response { (response) in
            guard let error = response.error else {
                completion(true)
                return
            }
            //print error
            completion(false)
        }
    }
    
    func connectToCreateRoom(memberId : Int,
                             completion : @escaping (Int?) -> Void) {
        guard isConnectedToInternet else {
            completion(nil)
            return
        }
        
        let params = [
            "user1Id" : UserManager.shared.userId,
            "user2Id" : memberId
        ]
        
        let request = Alamofire.request(urlBase + "chatRoom/createRoom", method: .post, parameters: params)
        
        request.responseString { (response) in
            guard response.result.isSuccess else {
                completion(nil)
                return
            }
            
            guard let result = response.result.value,
                let intVal = Int(result) else {
                    completion(nil)
                    return
            }
            
            completion(intVal)
        }
    }
    
    func connectToQuitRoom(roomId : Int,
                           completion : @escaping (Bool) -> Void) {
        guard isConnectedToInternet else {
            completion(false)
            return
        }
        
        let params = [
            "userId" : UserManager.shared.userId,
            "roomId" : roomId
                       ]
        
        let request = Alamofire.request(urlBase + "chatRoom/quitRoom", method: .post, parameters: params)
        
        request.response { (response) in
            guard let error = response.error else {
                completion(true)
                return
            }
            //print error
            completion(false)
        }
    }
    
    func connectToObserveRoom(roomId : Int, offset : Int,
                              completion : @escaping (ObserveRoomResult?) -> Void) {
        guard isConnectedToInternet else {
            completion(nil)
            return
        }
        
        let params = [
//            "userId" : UserManager.shared.userId,
            "roomId" : roomId,
            "offset" : offset
        ]
        
        let request = Alamofire.request(urlBase + "chatVoice/observeRoom", method: .post, parameters: params)
        
        request.responseJSON { (response) in
            guard response.result.isSuccess else {
                completion(nil)
                return
            }
            
            guard let result = response.result.value as? [String : Any] else {
                completion(nil)
                return
            }
            
            completion(ObserveRoomResult(dict: result))
        }
    }
    
    
}

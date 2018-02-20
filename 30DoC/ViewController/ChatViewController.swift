//
//  ChatViewController.swift
//  30DoC
//
//  Created by KAKAO on 2018. 2. 1..
//  Copyright © 2018년 Zedd. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

  
    
    @IBOutlet weak var tableView: UITableView!
    
    static func instance() -> ChatViewController? {
        return UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: classNameToString) as? ChatViewController
    }
    
    @IBOutlet weak var recordingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initVars()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "MyChatTableViewCell", bundle: nil), forCellReuseIdentifier: "MyChatTableViewCell")
        tableView.register( UINib(nibName: "OpponentTableViewCell", bundle: nil), forCellReuseIdentifier: "OpponentTableViewCell")
        // Do any additional setup after loading the view.
    }
    func initVars(){
       //View의 위쪽에만 선을 주고, shadow주기
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction private func StartRecordingButtonClicked(_ sender: UIButton) {
        if let viweController = RecordingViewController.instance(){
            //self.navigationController?.pushViewController(viweController, animated: true)
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.isNavigationBarHidden = true
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.isNavigationBarHidden = false
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ChatViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyChatTableViewCell", for: indexPath)
        cell.selectionStyle = .none
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 30))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 30))
        label.text = "오늘 날짜"
        label.textAlignment = .center
        view.addSubview(label)
        return view
    }
    
}


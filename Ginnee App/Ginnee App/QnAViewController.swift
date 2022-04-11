//
//  QnAViewController.swift
//  Ginnee App
//
//  Created by Admin on 26/03/22.
//

import UIKit

class QnAViewController: UIViewController,UITableViewDataSource {
    
    var questionArray:[QuestionMedata]=[]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QnATableViewCell", for: indexPath) as! QnATableViewCell
        cell.questionLabel.text = questionArray[indexPath.row].title
        cell.lhsLabel.text = questionArray[indexPath.row].lhs
        cell.rhsLabel.text = questionArray[indexPath.row].rhs
        return cell

    }
    
    @IBOutlet weak var qnaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qnaTableView.dataSource = self
        qnaTableView.register(UINib(nibName: "QnATableViewCell", bundle: nil), forCellReuseIdentifier: "QnATableViewCell")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let apiconnection = ApiConnection()
        apiconnection.getQuestions { data, error in
            self.questionArray=data ?? []

            DispatchQueue.main.async {
                self.qnaTableView.reloadData()
            }

        }
    }
    

    @IBAction func proceedClicked(_ sender: Any) {
        print("proceedClicked q wew")
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WiteyourStroyViewController") as? WiteyourStroyViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

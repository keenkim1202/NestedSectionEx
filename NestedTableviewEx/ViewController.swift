//
//  ViewController.swift
//  NestedTableviewEx
//
//  Created by KEEN KIM on 2022/08/26.
//

import UIKit

// https://sapandiwakar.in/nested-sections-in-uitableview/
class ViewController: UIViewController {
    
    @IBOutlet weak var subjectTableView: UITableView!
    
    enum CellType: String {
        case section = "SectionCell"
        case subsection = "SubsectionCell"
        case item = "ItemCell"
        
        func dequeueCell(_ tableView: UITableView) -> UITableViewCell? {
          let cell = tableView.dequeueReusableCell(withIdentifier: self.rawValue)
          return cell
        }
    }
    
    let cells: [CellType] = [.section, .section, .item]
    let sectionTitles: [String] = ["Section 1", "Section 2", "Section 3"]
    let subsectionTitles: [String] = ["subsection 1", "subsection 2"]
    let itemTitles: [String] = ["A", "B", "C", "D", "E"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subjectTableView.delegate = self
        subjectTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subsectionTitles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let subsectionCell = tableView.dequeueReusableCell(withIdentifier: SubsectionCell.identifier) as? SubsectionCell else { return UITableViewCell() }
        subsectionCell.subsectionLabel.text = subsectionTitles[indexPath.row]
        return subsectionCell
    }
}

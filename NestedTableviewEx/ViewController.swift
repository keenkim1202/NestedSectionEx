//
//  ViewController.swift
//  NestedTableviewEx
//
//  Created by KEEN KIM on 2022/08/26.
//

import UIKit

// https://sapandiwakar.in/nested-sections-in-uitableview/
// https://stackoverflow.com/questions/35394191/making-simple-accordion-tableview-in-swift
// https://github.com/jeantimex/ios-swift-collapsible-table-section-in-grouped-section/blob/master/README.md
// https://mobikul.com/create-multilevel-uitableview-in-swift-without-third-party/

class ViewController: UIViewController {
    @IBOutlet weak var subjectTableView: UITableView!
    
    let sectionTitles: [String] = ["Section 1", "Section 2", "Section 3"]
    let subsectionTitles: [String] = ["subsection 1", "subsection 2", "subsection 3"]
    let itemTitles: [String] = ["A", "B", "C", "D", "E"]
    
    let sections: [Section] = [
        Section(title: "Section 1", subSection: [
            SubSection(subSection: "sub 1", items: ["1-1", "1-2", "1-3"]),
            SubSection(subSection: "sub 2", items: ["2-1", "2-2", "2-3"]),
            SubSection(subSection: "sub 3", items: ["3-1", "3-2"])
        ]),
        Section(title: "Section 2", subSection: [
            SubSection(subSection: "sub A", items: ["A-1", "A-2"]),
            SubSection(subSection: "sub B", items: ["B-1", "B-2", "B-3"])
        ]),
        Section(title: "Section 3", subSection: [
            SubSection(subSection: "sub 가", items: ["가-1", "가-2"]),
            SubSection(subSection: "sub 나", items: ["나-1", "니-2", "니-3"]),
            SubSection(subSection: "sub 다", items: ["다-1", "디-2"]),
            SubSection(subSection: "sub 라", items: ["라-1", "라-2"])
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subjectTableView.delegate = self
        subjectTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].subSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let subsectionCell = tableView.dequeueReusableCell(withIdentifier: SubsectionCell.identifier) as? SubsectionCell else { return UITableViewCell() }
        
        let section = sections[indexPath.section]
        let subsection = section.subSection[indexPath.row]
        
        subsectionCell.subsectionLabel.text = subsection.subSection
        return subsectionCell
    }
}

//
//  CottageTableViewController.swift
//  ARCottageExample
//
//  Created by admin on 4/21/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import QuickLook

class CottageTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let modelsName = ["CottageOne", "CottageTwo"]
    private var selectedModelIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CottageTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modelsName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CottageTableViewCell", for: indexPath) as! CottageTableViewCell
        let modelName = modelsName[indexPath.row]
        cell.createCell(nameImage: modelName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedModelIndex = indexPath.row
        let previewController = QLPreviewController()
        previewController.dataSource = self
        previewController.delegate = self
        present(previewController, animated: true)
    }
    
    
}


extension CottageTableViewController: QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let url = Bundle.main.url(forResource: modelsName[selectedModelIndex], withExtension: "usdz")!
        return url as QLPreviewItem
    }
    
    
}

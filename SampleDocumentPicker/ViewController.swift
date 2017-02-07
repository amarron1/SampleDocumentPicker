//
//  ViewController.swift
//  SampleDocumentPicker
//
//  Created by amarrron on 2017/02/06.
//  Copyright © 2017年 amarron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIDocumentPickerDelegate, UIDocumentMenuDelegate {


    let UTIs:[String] = ["public.data"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: IBAction
    // Save to this application from iCloud
    @IBAction func importDocumentPicker(_ sender: Any) {
        let importPicker = UIDocumentPickerViewController(documentTypes: self.UTIs, in: .import)
        importPicker.delegate = self
        present(importPicker, animated: true, completion: nil)
        
    }
    
    // Save to this application from other applications
    @IBAction func importDocumentMenu(_ sender: Any) {
        let importMenu = UIDocumentMenuViewController(documentTypes: self.UTIs, in: .import)
        importMenu.delegate = self
        importMenu.popoverPresentationController?.sourceView = self.view
        present(importMenu, animated: true, completion: nil)
    }
    
    
    // Send to iCloud from this application
    @IBAction func exportDocumentPicker(_ sender: Any) {
        // Set the file you want to send
        let url = Bundle.main.url(forResource: "image", withExtension: "jpg")
        let exportPicker = UIDocumentPickerViewController(url: url!, in: UIDocumentPickerMode.exportToService)
        exportPicker.delegate = self
        present(exportPicker, animated: true, completion: nil)

    }
    
    // Send to other applications from this application
    @IBAction func exportMenuPicker(_ sender: Any) {
        // Set the file you want to send
        let url = Bundle.main.url(forResource: "image", withExtension: "jpg")
        let exportMenu = UIDocumentMenuViewController(url: url!, in: UIDocumentPickerMode.exportToService)
        exportMenu.delegate = self
        exportMenu.popoverPresentationController?.sourceView = self.view
        present(exportMenu, animated: true, completion: nil)
        
    }

    
    // MARK: UIDocumentPickerDelegate
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        if controller.documentPickerMode == .import {
            let alert:UIAlertController = UIAlertController(title: "Successfully imported \(url.lastPathComponent)",
                message: nil,
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .default,
                                          handler:nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: UIDocumentMenuDelegate
    public func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker:
        UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }

}


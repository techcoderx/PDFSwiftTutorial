//
//  PDFViewController.swift
//  pdfSwiftExample
//
//  Created by Eng Tian Xi on 3/12/17.
//  Copyright © 2017 Eng Tian Xi. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var pdfView: UIWebView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pdfView.delegate = self
        spinner.hidesWhenStopped = true
        
        pdfView.scalesPageToFit = true
        
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "12inch_MacBook_PER_Mar2015", ofType: "pdf")!)
        let request = URLRequest(url: path)
        pdfView.loadRequest(request)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        spinner.startAnimating()
        return true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        spinner.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        spinner.stopAnimating()
        print("Something went wrong")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

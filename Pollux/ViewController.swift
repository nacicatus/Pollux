//
//  ViewController.swift
//  Pollux
//
//  Created by Yajnavalkya on 2018. 10. 08..
//  Copyright © 2018. Yajnavalkya. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    var consented = false
    
    @IBAction func consentButtonClicked(_ sender: AnyObject)
    {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func surveyButtonClicked(_ sender: AnyObject)
    {
        if consented == true
        {
            let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
            taskViewController.delegate = self
            present(taskViewController, animated: true, completion: nil)
        } else {
            print("Check consent first!")
        }
        
        
    }
    
    
    
    @IBAction func activeTaskButtonClicked(_ sender: AnyObject)
    {
        
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?)
    {
        switch reason {
        case .completed:
            consented = true
        case .failed, .discarded, .saved:
            consented = false
        default:
            consented = false
        }
        taskViewController.dismiss(animated: true, completion: nil)
    }
}




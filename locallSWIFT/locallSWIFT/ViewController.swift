//
//  ViewController.swift
//  locallSWIFT
//
//  Created by Apps WeLove on 04/06/24.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var firstnameLbl: UILabel!

  @IBOutlet weak var lastnameLbl: UILabel!
  
  @IBOutlet weak var emailLbl: UILabel!
  

  override func viewDidLoad() {
    super.viewDidLoad()
   
    setUI()

  }


  func setUI(){
    firstnameLbl.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "firstname_text", comment: "")
    emailLbl.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "lastname_text", comment: "")
    lastnameLbl.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "lastname_text", comment: "")
  }


  @IBAction func changetoArabic(_ sender: Any) {

    UserDefaults.standard.set("ar", forKey: "selectedLanguage")
           LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
           UIView.appearance().semanticContentAttribute = .forceRightToLeft
           setUI()
           reloadRootViewController()
  }
  
  @IBAction func changetoEnglish(_ sender: Any) {
    UserDefaults.standard.set("en", forKey: "selectedLanguage")
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            setUI()
            reloadRootViewController()

 
  }
  
  private func reloadRootViewController() {
         if let window = UIApplication.shared.keyWindow {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let initialViewController = storyboard.instantiateInitialViewController()
             window.rootViewController = initialViewController
         }
     }


  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }


}


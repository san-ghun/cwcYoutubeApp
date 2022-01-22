//
//  InputViewController.swift
//  cwcYoutubeApp
//
//  Created by Sanghun Park on 2022/01/22.
//

import UIKit

class InputViewController: UIViewController {
    
    // MARK: - Properties
    var apiKey: String = Constants.API_KEY
    var playlistId: String = Constants.PLAYLIST_ID
    
    // MARK: IBOutlets
    @IBOutlet weak var titleImageView: UIImageView!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var keyTextField: UITextField!
    @IBOutlet weak var playlistIdLabel: UILabel!
    @IBOutlet weak var playlistIdTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .darkGray
        
        self.addViewsWithCode()
        
        keyTextField.text = Constants.API_KEY
        playlistIdTextField.text = Constants.PLAYLIST_ID
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapView))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: - Methods
    
    // MARK: IBActions
    @IBAction func tapView(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func didTappedSignInButton() {
        Constants.API_KEY = self.keyTextField.text ?? ""
        Constants.PLAYLIST_ID = self.playlistIdTextField.text ?? ""
        
        let vc = storyboard?.instantiateViewController(withIdentifier: Constants.viewController) as? ViewController
        view.window?.rootViewController = vc
        view.window?.makeKeyAndVisible()
    }
    
    
    // MARK: - View with Code
    func addViewsWithCode() {
        self.addTitleImageView()
        self.addKeyLabel()
        self.addKeyTextField()
        self.addPlaylistIdLabel()
        self.addPlaylistIdTextField()
        self.addSignInButton()
    }
    
    func addTitleImageView() {
        let imageView: UIImageView = UIImageView(image: UIImage(named: "YTDataAPIv3"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        
        let centerX: NSLayoutConstraint
        centerX = imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        let centerY: NSLayoutConstraint
        centerY = NSLayoutConstraint(item: imageView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 0.6, constant: 0)
        
        let width: NSLayoutConstraint
        width = imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.65)
        
        let ratio: NSLayoutConstraint
        ratio = imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.65)
        
        centerX.isActive = true
        centerY.isActive = true
        width.isActive = true
        ratio.isActive = true
        
        self.titleImageView = imageView
    }
    
    func addKeyLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label)
        
        label.text = "Enter your API key"
        label.textAlignment = .left
        label.backgroundColor = .clear
         
        /*
        let margineGuide = view.layoutMarginsGuide

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: margineGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: margineGuide.leadingAnchor),
            label.heightAnchor.constraint(equalToConstant: 40),
            label.trailingAnchor.constraint(equalTo: margineGuide.trailingAnchor)
        ])
         */
        
        let centerX: NSLayoutConstraint
        centerX = label.centerXAnchor.constraint(equalTo: self.titleImageView.centerXAnchor)
        
        let top: NSLayoutConstraint
        top = label.topAnchor.constraint(equalTo: self.titleImageView.bottomAnchor, constant: 40)
        
        let left: NSLayoutConstraint
        left = label.leftAnchor.constraint(equalTo: self.titleImageView.leftAnchor, constant: 0)
        
        centerX.isActive = true
        top.isActive = true
        left.isActive = true
        
        self.keyLabel = label
    }
    
    func addKeyTextField() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(textField)
        
        textField.textContentType = .username
        textField.textAlignment = .left
        textField.placeholder = "API Key for YouTube Data v3"
        textField.autocapitalizationType = .none
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.backgroundColor = UIColor.lightGray
        textField.textColor = .white
        
        let centerX: NSLayoutConstraint
        centerX = textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        let top: NSLayoutConstraint
        top = textField.topAnchor.constraint(equalTo: self.keyLabel.bottomAnchor, constant: 15)
        
        let left: NSLayoutConstraint
        left = textField.leftAnchor.constraint(equalTo: self.titleImageView.leftAnchor, constant: 0)
        
        centerX.isActive = true
        top.isActive = true
        left.isActive = true
        
        self.keyTextField = textField
    }
    
    func addPlaylistIdLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label)
        
        label.text = "Enter YouTube Playlist ID"
        label.textAlignment = .left
        label.backgroundColor = .clear
         
        let centerX: NSLayoutConstraint
        centerX = label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        let top: NSLayoutConstraint
        top = label.topAnchor.constraint(equalTo: self.keyTextField.bottomAnchor, constant: 30)
        
        let left: NSLayoutConstraint
        left = label.leftAnchor.constraint(equalTo: self.titleImageView.leftAnchor, constant: 0)
        
        centerX.isActive = true
        top.isActive = true
        left.isActive = true
        
        self.playlistIdLabel = label
    }
    
    func addPlaylistIdTextField() {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(textField)
        
        textField.textContentType = .username
        textField.textAlignment = .left
        textField.placeholder = "Playlist ID from URL"
        textField.autocapitalizationType = .none
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.backgroundColor = UIColor.lightGray
        textField.textColor = .white
        
        let centerX: NSLayoutConstraint
        centerX = textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        let top: NSLayoutConstraint
        top = textField.topAnchor.constraint(equalTo: self.playlistIdLabel.bottomAnchor, constant: 15)
        
        let left: NSLayoutConstraint
        left = textField.leftAnchor.constraint(equalTo: self.titleImageView.leftAnchor, constant: 0)
        
        centerX.isActive = true
        top.isActive = true
        left.isActive = true
        
        self.playlistIdTextField = textField
    }
    
    func addSignInButton() {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        
        // Add target an IBAction for UIControl
        button.addTarget(self, action: #selector(didTappedSignInButton), for: UIControl.Event.touchUpInside)
        
        let centerX: NSLayoutConstraint
        centerX = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        let top: NSLayoutConstraint
        top = button.topAnchor.constraint(equalTo: self.playlistIdTextField.bottomAnchor, constant: 20)
        
        centerX.isActive = true
        top.isActive = true
        
        self.signInButton = button
    }

}

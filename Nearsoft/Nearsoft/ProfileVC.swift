
import UIKit
import AlamofireImage
import RealmSwift
import GoogleSignIn

class ProfileVC: UITableViewController {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    let realm = try! Realm()
    var user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        profilePic.layer.borderWidth = 1
        profilePic.layer.masksToBounds = false
        profilePic.layer.borderColor = UIColor.orangeColor().CGColor
        profilePic.layer.cornerRadius = profilePic.frame.height/2
        profilePic.clipsToBounds = true
        
        let persons = realm.objects(User.self)
        let person = persons[0] as User
        fullName.text = person.fullName
        emailLabel.text = person.email
        let profilePicURL =  NSURL(string: "\(person.profilePic)")
        self.profilePic.af_setImageWithURL(profilePicURL!)

        
        if user.profilePic == "" {
            profilePic.image = UIImage(named: "nearsoft-symbol")
        } else {
            profilePic.af_setImageWithURL(profilePicURL!)
        }
        
        
        let dayTimePeriodFormatter = NSDateFormatter()
        dayTimePeriodFormatter.dateFormat = "EEEE, dd, MMMM YYYY"
        
        if user.birthdate != nil {
            let dateString = dayTimePeriodFormatter.stringFromDate(user.birthdate!)
            birthDate.text = dateString
        } else {
            birthDate.text = "Birthdate not available"
        }
    }
    
    
    @IBAction func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
        
        try! realm.write {
            realm.deleteAll()
        }
        
        SwitchViewManager.switchToLogin()
    }
}


// MARK: - Table view data source

func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
}



import FirebaseFirestore
import FirebaseAuth
import Foundation

class SecondRegistrationViewViewModel: ObservableObject {
    @Published var user: User
    @Published var errorMessage = ""
 
    
    init(user: User) {
        self.user = user
    }
    
    func completeRegistration(name: String, height: Double, weight: Double) {
        user.name = name
        user.height = height
        user.weight = weight
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(user.asDictionary())
    }
    
    func validate(name: String, weight: String, height: String) -> Bool {
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !weight.trimmingCharacters(in: .whitespaces).isEmpty,
              !height.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please, fill in all the fields"
            return false
        }
        
        return true
    }

}
    

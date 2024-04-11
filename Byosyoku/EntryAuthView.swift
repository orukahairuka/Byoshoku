import SwiftUI
import FirebaseAuth

struct EntryAuthView: View {

    @State  var name:String = ""
    @State  var email:String = ""
    @State  var password:String = ""

    var body: some View {
        VStack{
            TextField("name", text: $name).padding().textFieldStyle(.roundedBorder)
            TextField("email address", text: $email).padding().textFieldStyle(.roundedBorder)
            TextField("password", text: $password).padding().textFieldStyle(.roundedBorder)

            Button(action: {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let user = result?.user {
                        let request = user.createProfileChangeRequest()
                        request.displayName = name
                        request.commitChanges { error in
                            if error == nil {
                                user.sendEmailVerification() { error in
                                    if error == nil {
                                        print("仮登録画面へ")
                                    }
                                }
                            }
                        }
                    }
                }
            }, label: {
                Text("新規登録")
            }).padding()
        }
    }
}

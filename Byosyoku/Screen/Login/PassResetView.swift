import SwiftUI
import FirebaseAuth

struct PasswordResetView: View {

    @State    var email:String = ""

    var body: some View {
        ZStack {
            BackgroundShape()
                .fill(Color.customMainColor)
                           .ignoresSafeArea()
            VStack{
                TextField("mail address", text: $email).padding().textFieldStyle(.roundedBorder)
                Button(action: {
                    Auth.auth().sendPasswordReset(withEmail: email) { error in
                        // ...
                    }
                }, label: {
                    Text("メール送信")
                })
            }
        }
    }
}


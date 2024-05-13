//
//  LoginAuth.swift
//  Byosyoku
//
//  Created by 櫻井絵理香 on 2024/04/10.
//

import SwiftUI
import FirebaseAuth

struct AuthenticationView: View {

    @State  var email:String = "test@mail.com"
    @State  var password:String = "Test1234"
    @State private var isRegisterd = false


    var body: some View {
        NavigationView{
            ZStack {
                BackgroundShape()
                    .fill(Color.customMainColor)
                    .ignoresSafeArea()

                VStack{
                    TextField("mail address", text: $email).padding().textFieldStyle(.roundedBorder)
                    TextField("password", text: $password).padding().textFieldStyle(.roundedBorder)

                    Button{
                        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                            guard let user = authResult?.user, error == nil else {
                                print("サインインに失敗しました:" ,error!.localizedDescription)
                                return
                            }
                            print("サインインに成功しました", user.email!)
                            isRegisterd = true
                        }
                    } label: {
                        Text("ログイン")
                    }.padding()

                    NavigationLink(destination: EntryAuthView(), label: {
                        Text("未登録の方はこちら")
                    })
                }
            }
        }
        NavigationLink(destination: ResearchView(),
                       isActive: $isRegisterd) {
            EmptyView()
        }
    }
}

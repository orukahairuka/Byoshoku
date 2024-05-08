//
//  LoginAuth.swift
//  Byosyoku
//
//  Created by 櫻井絵理香 on 2024/04/10.
//

import SwiftUI
import FirebaseAuth

struct AuthenticationView: View {
    
    @State  var email:String = ""
    @State  var password:String = ""
    
    var body: some View {
        NavigationView{
            ZStack {
                BackgroundShape()
                    .fill(Color.customMainColor)
                               .ignoresSafeArea()

                VStack{
                    TextField("mail address", text: $email).padding().textFieldStyle(.roundedBorder)
                    TextField("password", text: $password).padding().textFieldStyle(.roundedBorder)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("ログイン")
                    }).padding()
                    
                    NavigationLink(destination: EntryAuthView(), label: {
                        Text("未登録の方はこちら")
                    })
                }
            }
        }
    }
}

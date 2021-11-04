//
//  LoginVC.swift
//  flowe
//
//  Created by Mehmet Yavuz Zenginerler on 11/4/21.
//

import UIKit
import SwiftUI

struct LoginHC_Temp: View {
  var body: some View {
      LoginHome()
  }
}

class LoginHC: UIHostingController<LoginHC_Temp> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: LoginHC_Temp());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

struct LoginHC_Previews: PreviewProvider {
    static var previews: some View {
        LoginHome()
    }
}

struct LoginHome: View {
    
    @State var userID = ""
    @State var password = ""
    @State var loginSuccessful = false

    var body: some View {
        
        VStack {
            Spacer(minLength: 0)
            
            // Logo
            Image("temp_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 35) //DF
                .padding(.vertical)
            
            // Login Title & description
            HStack {
                VStack (alignment: .leading, spacing: 12, content: {
                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Please sign in to continue")
                        .foregroundColor(Color.white.opacity(0.5))
                })
                Spacer(minLength: 0)
            }.padding()
                .padding(.leading, 15)
            
            // Email Text Field
            HStack{
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width:35)
                
                TextField("", text: $userID)
                    .placeholder(when: userID.isEmpty) {
                        Text("EMAIL").foregroundColor(.gray)
                    }
            }.padding()
                .background(Color.white.opacity(userID == "" ? 0.06 : 0.24))
                .cornerRadius(15)
                .padding(.horizontal)
            
            // Password Text Field
            HStack{
                Image(systemName: "lock")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width:35)
                
                SecureField("", text: $password)
                    .placeholder(when: password.isEmpty) {
                        Text("PASSWORD").foregroundColor(.gray)
                    }
            }.padding()
                .background(Color.white.opacity(password == "" ? 0.06 : 0.24))
                .cornerRadius(15)
                .padding(.horizontal)
                .padding(.top)
            
            // Login Button
            Button (action: {
                self.loginSuccessful = true

                    
            }, label: {
                Text("LOGIN")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 150)
                    .background(Color("color4"))
                    .cornerRadius(15)

            }).padding(.top)
            
            // Forgot my password button
            Button (action: {}, label: {
                Text("Forgot my password")
                    .foregroundColor(.black)
            }).padding(.top, 8)
            
            Spacer(minLength: 0)
            
            // Sign up Text & Button
            HStack(spacing: 5){
                Text("Don't you have an account?")
                    .foregroundColor(Color.white.opacity(0.6))
                
                Button(action: {}, label: {
                    Text("Signup")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("color4"))
                })
            }.padding(.vertical)
        }
        .background(Color("color1").ignoresSafeArea(.all, edges: .all))
        .fullScreenCover(isPresented: $loginSuccessful) {
            SegueSwiftUI(storyboard: "Main", VC: "HomeVC")
        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

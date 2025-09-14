//
//  LoginView.swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 07/09/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe: Bool = false

    var body: some View {
		VStack {
            Text("Itenera Ai")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.appGreen46)
                .padding(.bottom, 40)

            
         	   Text("Hi, Welcome Back")
					.font(.title)
					.fontWeight(.bold)

				Text("Login to your account")
					.font(.callout)
					.fontWeight(.medium)
					.foregroundStyle(.appGrayB2)
					.padding(.bottom, 54)
            
			

            Button(action: {}) {
                Text("Sign in with Google")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding()
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, minHeight: 58)
            }
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.appGrayE5)
            )
			.padding(.bottom, 26)

			HStack {
				Rectangle()
					.frame(maxWidth: .infinity)
					.frame(height: 1)
					.foregroundStyle(.appGrayE5)
				
				Text("or log in with Email")
					.font(.caption)
					.fontWeight(.semibold)
					.foregroundStyle(.appGrayB2)
					.fixedSize(horizontal: true, vertical: false)
					.lineLimit(1)
					.layoutPriority(1)
					.padding(.horizontal, 8)
				
				Rectangle()
					.frame(maxWidth: .infinity)
					.frame(height: 1)
					.foregroundStyle(.appGrayE5)
			}
			.padding(.bottom, 40)

			// Email Field
			CustomTextView(text: $email, label: "Email")

            // PassWord Field
			CustomTextView(text: $password, label: "Password")

			// Section Mid - last
			HStack {

				Toggle(isOn: $rememberMe) { }
				.toggleStyle(CustomToggleStyle())
				.labelsHidden()
				
				Text("Remeber me")
					
				
				Spacer()
				
				Button(action: {}) {
					Text("Forgot your password?")
						.foregroundStyle(.appRed35)
				}
            }
			.padding(.bottom, 34)
			
			//Login Button
			CustomGreenButton(label: "Login") { }
        }
		.padding(.horizontal, 27)
    }
}

#Preview {
    LoginView()
}

struct CustomToggleStyle: ToggleStyle {
	func makeBody(configuration: Configuration) -> some View {
		Button(action: {
			withAnimation(.easeInOut(duration: 0.2)) {
				configuration.isOn.toggle()
			}
		}) {
			ZStack {
				RoundedRectangle(cornerRadius: 3)
					.stroke(configuration.isOn ? Color.green : Color.gray, lineWidth: 1)
					.background(
						RoundedRectangle(cornerRadius: 3)
							.fill(
								configuration.isOn ? .appGreen46 : Color.clear
							)
					)
					.frame(width: 14, height: 14)
				
				if configuration.isOn {
					Image(systemName: "checkmark")
						.font(.system(size: 8, weight: .bold))
						.foregroundColor(.white)
				}
			}
		}
		.buttonStyle(PlainButtonStyle())
	}
}

//
//  SignUpView.swift
//  ItineraAi
//
//  Created by Gideon Adewuyi on 09/09/2025.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
	@State private var repassword = ""

    var body: some View {
        VStack {
            Text("Itenera Ai")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.appGreen46)
                .padding(.bottom, 40)

            Text("Create your Account")
                .font(.title)
                .fontWeight(.bold)

            Text("Let's get started")
                .font(.callout)
                .fontWeight(.medium)
                .foregroundStyle(.appGrayB2)
                .padding(.bottom, 54)

            Button(action: {}) {
                Text("Sign up with Google")
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

                Text("or Sign up with Email")
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

            // re-PassWord Field
            CustomTextView(text: $repassword, label: "Confirm Password")

            //Login Button
            CustomGreenButton(label: "Login") {}
        }
        .padding(.horizontal, 27)
    }
}

#Preview {
    SignUpView()
}

//
//  R3.swift
//  App418
//
//  Created by IGOR on 28/03/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("R3")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack {
                
                HStack {

                    Circle()
                        .fill(.white.opacity(0.5))
                        .frame(width: 8, height: 8)
       
                    Circle()
                        .fill(.white.opacity(0.5))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 8, height: 8)
                    
                }
                
                Text("Calculate your salary")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(width: 200)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        .padding()
                })
            }
        }
    }
}

#Preview {
    R3()
}

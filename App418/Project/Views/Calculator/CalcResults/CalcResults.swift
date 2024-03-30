//
//  CalcResults.swift
//  App418
//
//  Created by IGOR on 29/03/2024.
//

import SwiftUI

struct CalcResults: View {

    @StateObject var viewModel: CalculatorViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Result")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                        .padding()
                 
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .regular))
                            
                            Spacer()
                        }
                    })
                }
                .padding()

                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        Image("1234")
                            .padding(.top)
                        
                        Text("Your calculation result")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                            .frame(width: 250)
                            .multilineTextAlignment(.center)

                        Text("Check out the payroll calculation")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.bottom)
                        
                        HStack {
                            
                            VStack(spacing: 8) {
                                                    
                                Text("$\(String(format: "%.f", Double(viewModel.calculatePercentage())))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 26, weight: .bold))
               
                                
                                Text("Hourly")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.white.opacity(0.6), lineWidth: 2))
                            .padding(1)
                            
                            VStack(spacing: 8) {
                                                    
                                Text("$\(String(format: "%.f", Double(viewModel.calculatePercentageDaily())))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 26, weight: .bold))

                                
                                Text("Hourly")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.white.opacity(0.6), lineWidth: 2))
                            .padding(1)
                        }
                        
                        HStack {
                            
                            VStack(spacing: 8) {
                                                    
                                Text("$\(String(format: "%.f", Double(viewModel.calculatePercentageWeekly())))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 26, weight: .bold))

                                
                                Text("Weekly")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.white.opacity(0.6), lineWidth: 2))
                            .padding(1)
                            
                            VStack(spacing: 8) {
                                                    
                                Text("$\(String(format: "%.f", Double(viewModel.calculatePercentage2Week())))")
                                        .foregroundColor(.white)
                                        .font(.system(size: 26, weight: .bold))
                                
                                Text("In 2 Weeks")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.white.opacity(0.6), lineWidth: 2))
                            .padding(1)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    CalcResults(viewModel: CalculatorViewModel())
}

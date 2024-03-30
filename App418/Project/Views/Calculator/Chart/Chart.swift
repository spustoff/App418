//
//  Chart.swift
//  App418
//
//  Created by IGOR on 29/03/2024.
//

import SwiftUI

struct Chart: View {
    
    @StateObject var viewModel: CalculatorViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("\(viewModel.currentCurrency)")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .padding(.bottom, 25)
                
                HStack {
                    
                    Text(viewModel.currentCurrency)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                    
                    Text("+\(String(format: "%.f", Double(.random(in: 0...2)))).\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))%")
                        .foregroundColor(.green)
                        .font(.system(size: 11, weight: .regular))
                    
                    Spacer()
                    
                    Text("$\(String(format: "%.f", Double(.random(in: 1...3))))\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9)))),\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                
                Image("graph")
                    .resizable()
                
                HStack {
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(.red))
                        })
                        .padding(.leading)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isChart = false
                                
                            }
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isCurr = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Apply")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(.green))
                        })
                        .padding(.trailing)
                    }
                    .padding(.vertical)
                }
            }
            .padding()
        }
    }
}

#Preview {
    Chart(viewModel: CalculatorViewModel())
}

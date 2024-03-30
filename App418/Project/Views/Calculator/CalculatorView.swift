//
//  CalculatorView.swift
//  App418
//
//  Created by IGOR on 28/03/2024.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Salary calculator")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                HStack {
                    
                    if viewModel.currentCurrency.isEmpty {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                             
                                viewModel.isCurr = true
                            }
                            
                        }, label: {
                            
                            Text("EUR/USD")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 20, weight: .bold))
                         
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                        })
                        
                    } else {
   
                        Button(action: {
                            
                            withAnimation(.spring()) {
                             
                                viewModel.isCurr = true
                            }
                            
                        }, label: {
                            
                             Text(viewModel.currentCurrency)
                                 .foregroundColor(Color("prim"))
                                 .font(.system(size: 20, weight: .bold))
                          
                             Image(systemName: "chevron.right")
                                 .foregroundColor(.white)
                                 .font(.system(size: 18, weight: .medium))
                        })
                    }
                }
                .padding(.vertical, 40)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        HStack {
                            
                            Text("Bet")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.bet.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.bet)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        HStack {
                            
                            Text("Working hours")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.workingHours.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.workingHours)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        Button(action: {
           
                            viewModel.Vbet = Int(viewModel.bet) ?? 0
                            viewModel.VWH = Int(viewModel.workingHours) ?? 0
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isResult = true
                            }
 
                        }, label: {
                            
                            Text("Calculate")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                                .padding(.top)
                        })
                        .opacity(viewModel.bet.isEmpty || viewModel.workingHours.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.bet.isEmpty || viewModel.workingHours.isEmpty ?  true : false)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
            }
        }
        .sheet(isPresented: $viewModel.isResult, content: {
            
            CalcResults(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isCurr, content: {
            
            CurrenciesView(viewModel: viewModel)
        })
    }
}

#Preview {
    CalculatorView()
}

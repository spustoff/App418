//
//  CurrenciesView.swift
//  App418
//
//  Created by IGOR on 29/03/2024.
//

import SwiftUI

struct CurrenciesView: View {
    
    @StateObject var viewModel: CalculatorViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Currency pairs")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                    
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
                
                HStack {
                    
                    if viewModel.currentCurrency.isEmpty {
                        
                        Text(viewModel.currCur)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)

                    } else {
                        
                        Text(viewModel.currentCurrency)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)

                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                .padding(.vertical)

                Text("Currency pairs")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.currencies, id: \.self) {  index in
                            
                                Button(action: {
                                    
                                    viewModel.currentCurrency = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isChart = true
                                    }
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .semibold))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                })
                            }
                        })
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isChart, content: {
            
            Chart(viewModel: viewModel)
        })
    }
}

#Preview {
    CurrenciesView(viewModel: CalculatorViewModel())
}

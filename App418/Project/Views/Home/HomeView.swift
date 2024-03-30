//
//  HomeView.swift
//  App418
//
//  Created by IGOR on 28/03/2024.
//

import SwiftUI
import StoreKit

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Home")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Text("Welcome to VersaNet Pro")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Text("Select the desired section and start working")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                            .frame(width: 200)
                            .multilineTextAlignment(.center)
                        
                    }
                    .padding()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isTasks = true
                        }
                        
                    }, label: {
                        
                        Text("My tasks")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            .overlay(
                                
                                VStack {
                                    
                                    Spacer()
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Image("lists")
                                    }
                                }
                            )
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isCalculator = true
                        }
                        
                    }, label: {
                        
                        Text("Salary calculator")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            .overlay(
                                
                                VStack {
                                    
                                    Spacer()
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Image("dom")
                                    }
                                }
                            )
                    })
                    
                    Rectangle()
                        .fill(.white.opacity(0.4))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical)
                    
                    VStack(spacing: 20) {
                        
                        Button(action: {
                            
                            guard let url = URL(string: DataManager().usagePolicy) else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "doc.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Usage Policy")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Rectangle()
                            .fill(.white.opacity(0.4))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Rate app")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .semibold))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                    }
                    
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isTasks, content: {
            
            MyTasksView()
        })
        .sheet(isPresented: $viewModel.isCalculator, content: {
            
            CalculatorView()
        })
    }
}

#Preview {
    HomeView()
}

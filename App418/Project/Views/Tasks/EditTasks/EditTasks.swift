//
//  EditTasks.swift
//  App418
//
//  Created by IGOR on 28/03/2024.
//

import SwiftUI

struct EditTasks: View {

    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Editing cards")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        HStack {
                            
                            Text("Scheduled tasks")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.schedel.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.schedel)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        HStack {
                            
                            Text("Completed tasks")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.complet.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.complet)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        Button(action: {
                            
                            viewModel.completed = viewModel.complet
                            viewModel.scheduled = viewModel.schedel
                            
                            viewModel.schedel = ""
                            viewModel.complet = ""
                            
                            viewModel.isEdit = false
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                                .padding(.top)
                        })
                        .opacity(viewModel.complet.isEmpty || viewModel.schedel.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.complet.isEmpty || viewModel.schedel.isEmpty ?  true : false)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
            }
        }
    }
}

#Preview {
    EditTasks(viewModel: HomeViewModel())
}

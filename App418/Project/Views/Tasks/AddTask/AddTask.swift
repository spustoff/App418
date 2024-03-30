//
//  AddTask.swift
//  App418
//
//  Created by IGOR on 28/03/2024.
//

import SwiftUI

struct AddTask: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("New tasks")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))    
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        HStack {
                            
                            Text("Name")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.taskName.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.taskName)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        HStack {
                            
                            Text("Client")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.taskClient.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.taskClient)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        HStack {
                            
                            Text("Cost")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Value")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.taskCost.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.taskCost)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        
                        Button(action: {
                            
                            viewModel.addTask()
                            
                            viewModel.taskName = ""
                            viewModel.taskClient = ""
                            viewModel.taskCost = ""
                            
                            viewModel.fetchTasks()
                            
                            viewModel.isAdd = false
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                                .padding(.top)
                        })
                        .opacity(viewModel.taskName.isEmpty || viewModel.taskClient.isEmpty || viewModel.taskCost.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.taskName.isEmpty || viewModel.taskClient.isEmpty || viewModel.taskCost.isEmpty ? true : false)
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
    AddTask(viewModel: HomeViewModel())
}

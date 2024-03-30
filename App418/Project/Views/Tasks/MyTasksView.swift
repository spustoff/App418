//
//  MyTasksView.swift
//  App418
//
//  Created by IGOR on 28/03/2024.
//

import SwiftUI

struct MyTasksView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("My tasks")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                
                HStack {
                    
                    VStack(spacing: 8) {
        
                        if viewModel.scheduled.isEmpty {
                            
                            Text("0")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                        } else {
                            
                            Text(viewModel.scheduled)
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                        }
                        
                        Text("Scheduled tasks")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(.white.opacity(0.6), lineWidth: 2))
                    .padding(1)
                    
                    VStack(spacing: 8) {
                        
                        if viewModel.completed.isEmpty {
                            
                            Text("0")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                        } else {
                            
                            Text(viewModel.completed)
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                            
                        }
                        
                        Text("Scheduled tasks")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).stroke(.white.opacity(0.6), lineWidth: 2))
                    .padding(1)
                }
                .padding(.vertical)
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isEdit = true
                    }
                    
                }, label: {
                    
                    Text("Edit")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                })
                .padding(.bottom)
                
                if viewModel.tasks.isEmpty {
                    
                    VStack {
                        
                        Image("note")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        
                        Text("Your tasks")
                            .foregroundColor(.white)
                            .font(.system(size: 30, weight: .bold))
                            .padding(8)
                        
                        Text("Here you can track your tasks")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .semibold))
                                .frame(width: 250, height: 45)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.tasks, id: \.self) { index in
                            
                                HStack {
                                    
                                    Image(systemName: "doc.on.doc")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 40, weight: .regular))
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        
                                        Text(index.taskName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .semibold))
                                        
                                        Text(index.taskClient ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                    
                                    Spacer()
                                    
                                    Rectangle()
                                        .fill(.white.opacity(0.7))
                                        .frame(width: 1, height: 50)
                                        .padding(.horizontal)
                                    
                                    
                                    
                                    Text("$\(index.taskCost ?? "")")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .semibold))
                                }
                                
                                Rectangle()
                                    .fill(.white.opacity(0.7))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchTasks()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddTask(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isEdit, content: {
            
            EditTasks(viewModel: viewModel)
        })
    }
}

#Preview {
    MyTasksView()
}

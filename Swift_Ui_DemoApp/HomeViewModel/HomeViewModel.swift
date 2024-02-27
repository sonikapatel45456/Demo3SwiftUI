//
//  HomeViewModel.swift
//  Swift_Ui_DemoApp
//
//  Created by Sonika Patel on 22/02/24.
//

import Foundation
import Combine
class HomeViewModel: ObservableObject {
enum ViewState {
    case START
    case LOADING
    case SUCCESS(users: [User])
    case FAILURE(error: String)
}
    @Published var currentState: ViewState = .START
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        getUsers()
    }
    
    func getUsers() {
        self.currentState = .LOADING
        APIService.shared.getuser()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Execution Finihsed.")
                case .failure(let error):
                    self.currentState = .FAILURE(error: error.localizedDescription)
                }
            } receiveValue: { users in
                self.currentState = .SUCCESS(users: users)
            }.store(in: &cancelables)
    }
}

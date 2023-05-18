//
//  SearchCitiesView.swift
//  bold-test
//
//  Created by Daniel Crespo Duarte on 16/05/23.
//

import Resolver
import SwiftUI
import SkeletonUI

struct SearchCitiesView<ViewModelType>: View where ViewModelType: SearchCitiesViewModelType {
    
    @ObservedObject var viewModel: ViewModelType = Resolver.resolve()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            SkeletonList(with: viewModel.state.cities, quantity: viewModel.state.numberSkeletonCell) { loading, city in
                NavigationLink {
                    DetailCityForecastView<DetailCityForecastViewModel>(city: city)
                } label: {
                    CityCellView(city: city, loading: loading)
                }
            }
            .listStyle(.inset)
            .navigationBarTitle(SearchCitiesState.Constants.title, displayMode: .inline)
        }
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always)
        )
        .onChange(of: searchText) { index in
            viewModel.searchCity(query: index)
        }
        .onDisappear {
            viewModel.onDisAppear()
        }
        .alert(isPresented: $viewModel.state.alert) {
            Alert(
                title: Text(SearchCitiesState.Constants.error),
                message: Text(SearchCitiesState.Constants.errorMessage),
                dismissButton: .cancel(Text(SearchCitiesState.Constants.ok)))
        }
    }
}

//
//  TabBarPresenter.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import UIKit

private struct Settings {
    static let initialTabBarIndex = 0
}

extension UI.TabBar {
    
    final class Presenter {
        
        weak var output: TabBarPresenterOutput?
        weak var view: TabBarView?
        
        private var tabViews: [TabBarPresentable] = []
        private var selectedTabView: TabBarPresentable?
        private var items: [TabBar.Item] = []
    }
}

extension UI.TabBar.Presenter: TabBarViewOutput {
    func viewDidSelectTabBarItem(at index: Int) {
        displayTabBarItem(at: index)
    }
    
    func viewDidLoad() {
        items = prepareTabBarItems()
        view?.updateTabBar(items: items)
        displayTabBarItem(at: Settings.initialTabBarIndex)
    }
}

extension UI.TabBar.Presenter: TabBarPresenter {
    
    func prepareTabBarItems() -> [TabBar.Item] {
        let items = tabViews.enumerated().map { index, item in
            TabBar.Item(image: item.icon,
                        selectedImage: item.selectedIcon,
                        shouldShowBadge: item.shouldShowBadge,
                        isSelected: index == Settings.initialTabBarIndex)
        }
        return items
    }
    
    func displayTabBarItem(at index: Int) {
        if let currentView = selectedTabView {
            view?.hide(contentController: currentView.toPresent())
        }
        
        let tabView = tabViews[index]
        selectedTabView = tabView
        view?.display(contentController: tabView.toPresent())
    }
    
    func setup(views: [TabBarPresentable]) {
        tabViews = views
    }
    
    func toPresent() -> UIViewController? {
        view?.toPresent()
    }
}

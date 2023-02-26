//
//  OnAirTvSeriesViewController.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 22.02.23.
//

import UIKit

final class OnAirTvSeriesViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    weak var output: OnAirTvSeriesViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewDidLoad()
        
    }
}

private extension OnAirTvSeriesViewController {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: TvSeriesTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: TvSeriesTableViewCell.identifier)
        tableView.reloadData()
    }
}

extension OnAirTvSeriesViewController: OnAirTvSeriesView {
    func setupView() {
        setupTableView()
    }
}

extension OnAirTvSeriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output?.viewDidGetTvSeriesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TvSeriesTableViewCell.identifier, for: indexPath) as? TvSeriesTableViewCell,
              let tvSeries = output?.viewDidGetTvSeriesToShow()
        else { fatalError() }
        cell.configure(with: tvSeries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TvSeriesTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output?.viewDidTapTvSeries(at: indexPath.row)
    }
}

//
//  Resolver.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 21.02.23.
//

import Foundation
import Swinject

extension App {
    
    final class DIResolver {
        
        static func resolveDependencies() -> Assembler? {
            
            let topRatedTvSeriesFlow: [Assembly] = [UI.TopRatedTvSeries.Assembly()]
            let onAirTvSeriesFlow: [Assembly] = [UI.OnAirTvSeries.Assembly()]
            let tabBarFlow: [Assembly] = [UI.TabBar.Assembly()]
            
            let moduleAssembly = topRatedTvSeriesFlow
            + onAirTvSeriesFlow
            + tabBarFlow
            
            let moduleAssembler = Assembler(moduleAssembly, parent: resolveServices())
            
            let assembler = Assembler([CoordinatorAssembly()], parent: moduleAssembler)
            
            return assembler
        }
    }
    
    private static func resolveServices() -> Assembler {
        Assembler([ServiceAssembly()])
    }
}

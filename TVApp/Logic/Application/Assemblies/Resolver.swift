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
            let moduleAssembly = [Assembly]()
            
            let moduleAssembler = Assembler(moduleAssembly, parent: resolveServices())
            let assembler = Assembler([CoordinatorAssembly()], parent: moduleAssembler)
            
            return assembler
        }
    }
    
    private static func resolveServices() -> Assembler {
        Assembler([ServiceAssembly()])
    }
}

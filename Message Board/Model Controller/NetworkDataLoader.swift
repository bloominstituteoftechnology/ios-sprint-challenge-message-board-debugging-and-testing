//
//  NetworkDataLoader.swift
//  Message Board
//
//  Created by Jerry haaser on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    func loadData(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void)

    func loadData(from url: URL, completion: @escaping (Data?, Error?) -> Void)
}

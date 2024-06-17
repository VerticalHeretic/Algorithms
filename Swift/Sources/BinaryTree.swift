//
//  BinaryTree.swift
//
//
//  Created by Łukasz Stachnik on 17/06/2024.
//

import Foundation

class Node {
    let data: String
    var rightChild: Node?
    var leftChild: Node?

    init(
        data: String,
        rightChild: Node? = nil,
        leftChild: Node? = nil
    ) {
        self.data = data
        self.rightChild = rightChild
        self.leftChild = leftChild
    }
}

func initExampleTree() -> Node {
    let root = Node(data: "root")
    let root_left_1 = Node(data: "root_left_1")
    let root_right_1 = Node(data: "root_right_1")
    let root_right_2 = Node(data: "root_right_2")
    root.leftChild = root_left_1
    root.rightChild = root_right_1

    root_right_1.rightChild = root_right_2
    return root
}

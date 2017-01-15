import Foundation

/*
 Vertices
 */
public struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex: Hashable {
    
    public var hashValue: Int {
        return "\(data)".hashValue
    }
    
    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}

/*
 Edges
 */
public enum EdgeType {
    case directed, undirected
}

public struct Edge<T: Hashable> {
    public var source: Vertex<T>
    public var destination: Vertex<T>
    public let weight: Double? //An edge also have a numberical weight. This is useful for future algorithms. You may want to find out how much it cost to fly from Hong Kong to Tokyo
}

extension Edge: Hashable {
    
    public var hashValue: Int {
        return "\(source)\(destination)\(weight)".hashValue
    }
    
    static public func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source && lhs.destination == rhs.destination && lhs.weight == rhs.weight
    }
}

protocol Graphable {
    associatedtype Element: Hashable //Protocol associatedType called Element. This allow the protocol to be generic, to hold any type
    var description: CustomStringConvertible {get} //print out the contents of a graph. This can help with debugging
    func createVertex(data: Element) -> Vertex<Element> //provide a utility method to create a vertex
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) //provides a utility to add an edge between two vertices. You can specify the weight or whether an edge is directed or undirected
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? //Provides a utility to get the weight of an dege between two vertices
    func edges(from source: Vertex<Element>) -> [Edge<Element>]? //Provide a utiity to retrieve all the edges that source vertex connects to
    
}

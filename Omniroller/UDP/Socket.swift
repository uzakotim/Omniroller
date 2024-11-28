import Foundation
import Network
import SwiftUI
class UDPSocket {
    private var connection: NWConnection?
    private var ipAddress: String
    private var port: UInt16
    let serverIP = "www.featsion.com"
    let serverPort: UInt16 = 12345
    @AppStorage("TokenMode") public var isTokenMode: Bool = false

    
    init(ipAddress: String, port: UInt16) {
        // Initialize a UDP connection

        self.ipAddress = ipAddress
        self.port = port
        setupConnection()
    }
    private func setupConnection() {
           let parameters: NWParameters
           if isTokenMode {
               // Use TCP connection
               parameters = .tcp
               print("Configured for TCP mode")
               connection = NWConnection(
                    host: NWEndpoint.Host(serverIP),
                    port: NWEndpoint.Port(integerLiteral: serverPort),
                    using: parameters)
                connection?.start(queue: .global());
                send("human::timur::12345".data(using: .utf8)!)
               
           } else {
               // Use UDP connection
               parameters = .udp
               print("Configured for UDP mode")
               connection = NWConnection(
                   host: NWEndpoint.Host(ipAddress),
                   port: NWEndpoint.Port(integerLiteral: port),
                   using: parameters
               )
               connection?.start(queue: .global());
           }
           
           
       }
    
    func send(_ content: Data) {
            self.connection?.send(content: content, completion: NWConnection.SendCompletion.contentProcessed(({ (NWError) in
                if (NWError == nil) {
                    print("Data was sent")
                } else {
                    print("ERROR! Error when data (Type: Data) sending. NWError: \n \(NWError!)")
                }
            })))
        }
    
    func start() {
        setupConnection() // Ensure the connection is up-to-date with the mode
        print("Connection started in \(isTokenMode ? "TCP" : "UDP") mode")
    }
    
    func stop() {
        // Stop the connection
        connection?.cancel()
        print("Connection stopped")
    }
}



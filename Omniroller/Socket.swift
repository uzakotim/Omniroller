import Foundation
import Network

class UDPSocket {
    private var connection: NWConnection?
    
    init(ipAddress: String, port: UInt16) {
        // Initialize a UDP connection
        connection = NWConnection(
            host: NWEndpoint.Host(ipAddress),
            port: NWEndpoint.Port(integerLiteral: port),
            using: .udp
        )
    }
    
    func send(_ content: Data) {
            self.connection?.send(content: content, completion: NWConnection.SendCompletion.contentProcessed(({ (NWError) in
                if (NWError == nil) {
                    print("Data was sent to UDP")
                } else {
                    print("ERROR! Error when data (Type: Data) sending. NWError: \n \(NWError!)")
                }
            })))
        }
    
    func start() {
        // Start the UDP connection
        connection?.start(queue: .global())
    }
    
    func stop() {
        // Stop the UDP connection
        connection?.cancel()
    }
}



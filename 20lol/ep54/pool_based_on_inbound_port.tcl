when CLIENT_ACCPEPTED {
 
    # Try assigning the pool based on the client destination port
    # If the pool assignment fails, use the VS default pool
    if {[catch {pool pool_[TCP::local_port]} result]}{
        # Pool did not exist, so log the value for testing
        # The VS default pool will be used
        log local0. "pool_[TCP::local_port] doe not exist"
    } else {
        # Pool assignment succeeded
    }
}

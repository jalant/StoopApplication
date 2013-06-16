Geocoder.configure(



  # geocoding service request timeout, in seconds (default 3):
  :timeout => 5


)


Geocoder::Configuration.always_raise = [SocketError, TimeoutError]
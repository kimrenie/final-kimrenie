What happens when a user enters a URL into the browser?

First of all, the first step to reading a URL is analyzing the parts within it. A URL generally consists of a scheme that allows the user to use Hypertext Transfer Protocol Secure in order to communicate with the requested server over the internet. The second part of the URL is it's domain name that represents an individual's IP address. Following this, there is a path that leads to the specific file or resource that is trying to be reached. 

With all of this understood, our active browser takes this URL and uses the IP address that is retreived from the domain name using a DNS lookup. First the browser checks chache records around it's own resources such as the user's personal browser or their personal network. If that isn't enough to locate the server, a reverse DNS lookup is able to ask DNS servers through the internet repeatedly until the correct record is located. Once it successfully retrieve's the requested DNS record, a TCP (Transfer Control Protocol) connection is finally ready to start. TCP looks for the receiving sever and makes a connection similar to the 3-way handshake. This is illustrated as the client "asks" to connects to the server and starts a request, the recipeint server receives that request and says "yes", and finally the client successfully receives the end response and a connection between the two endpoints is made. 

Now that this connection has been sucessfull, the HTTP protocols are able to begin. The client browser sends a request to the server for a specific page/resource. This request should be composed of a request line (containing methods such as GET, POST, etc.), metadata (headers that are shown as key value pairs that displays information about the client), and a body that is either empty or has spaces for the client to update (in the cast of a POST request, PUT request, etc.

All of this information is processed by the recipient server and the server is responsible for sending back a response that contains status, response headers, and of course, the data/resource that the client originally requested for. Once the browser receives this responce, it is able to render the content and produce the requested webpage. Done :)
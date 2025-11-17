import http.server
import socketserver
import os


def main():
    while True:
        datalogger_dir = os.path.join(os.path.dirname(__file__), '/opt/plcnext/logs')
        os.chdir(datalogger_dir)
        Handler = http.server.SimpleHTTPRequestHandler
        httpd = socketserver.TCPServer(("", 51880), Handler)
        httpd.serve_forever()

if __name__ == "__main__":
    main()

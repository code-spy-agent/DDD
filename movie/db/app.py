from http.server import HTTPServer, BaseHTTPRequestHandler
import json
from urllib.parse import urlparse, parse_qs
from database_operations import fetch_all_movies, fetch_movies_by_genre

class MovieHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        parsed_path = urlparse(self.path)
        path = parsed_path.path
        query = parse_qs(parsed_path.query)

        if path == '/movies':
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            movies = fetch_all_movies()
            self.wfile.write(json.dumps(movies).encode())
        elif path.startswith('/movies/genre/'):
            genre = path.split('/')[-1]
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            movies = fetch_movies_by_genre(genre)
            self.wfile.write(json.dumps(movies).encode())
        else:
            self.send_error(404)

def run(server_class=HTTPServer, handler_class=MovieHandler, port=3001):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    print(f'Starting server on port {port}...')
    httpd.serve_forever()

if __name__ == '__main__':
    run()

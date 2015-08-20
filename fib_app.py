from flask import Flask
app = Flask(__name__)

# Function from Downey 11.5
known = {0:0, 1:1}

def fibonacci(n):
    if n in known:
        return known[n]
    res = fibonacci(n-1) + fibonacci(n-2)
    known[n] = res
    return res


# Tells the app to send calls to /fib/x here
@app.route('/fib/<int:n>')
def fib(n):
    return str(fibonacci(n))


if __name__ == '__main__':
    # Ensures this is the main script running
    # and starts the local webserver.
    app.run(debug=True)
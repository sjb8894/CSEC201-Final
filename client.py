# Sam Benoist - CSEC 201 Final - Q3
import socket

port = 9999
host = "localhost"

sock = socket.socket()
sock.connect((host, port))
sock.send("Does this work".encode())
print(sock.recv(1024).decode())
sock.send(".....5....................".encode())
print(sock.recv(1024).decode())
print(sock.recv(1024).decode())
sock.send("512".encode())
print(sock.recv(1024).decode())
sock.send("bye".encode())
print(sock.recv(1024).decode())

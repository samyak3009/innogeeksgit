class Book:
    def __init__(x,col="Green"):
        x.colour = col
    def EnterBook(x):
        x.book_name = input("Enter the book Name: ")
        x.book_author= input("Enter the Book Author: ")
    def showBook(x):
        print("Book name is: ",x.book_name)
        print("Book author is: ",x.book_author)
        print("Book colour is: ",x.colour)
book=Book("Red")
book.EnterBook()
book.showBook()


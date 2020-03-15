#Our objective is to create a friends list prompt the user to add and view new friends
#and eventually return a complete list of friends
#declaring boolean statements
def yes():
    return True
def no():
    return False
#list of friends

my_friends = []
no_friends = ('no new friends?')


#we are gonna ask if the user wants to add new friends?
req_one = input("Do you want to add new friends? Type Yes or No: ")

#when user elects to add friend
if req_one == 'Yes':
    new_friends = [input("Great! lets add them! Separate with a comma(,): ")]
elif req_one == 'No':
    print(no_friends) 
else:
    print("input is case sensitive")

#request user to view new friends list
all_friends = new_friends + my_friends

req_two = input("do you want to see your new friends? : ")

if req_two == 'Yes':
    print(new_friends)
    
    #request user to view all friends
    req_three = input("would you like to see all your friends?: ")
    
    if req_three == 'Yes':
        
        print(all_friends)

    elif req_three == 'No':
        print("Ok lemme know whenever!") 
    #repeat
    else:
        print("input is case sensitive")
        req_four = input("would you like to see all your friends?: ")
            
        if req_four == 'Yes':
          
            print(all_friends)

        elif req_four == 'No':
            print("Ok lemme know whenever!")

elif req_two == 'No':
    print("guh damn so rude!")  
else:
    print("Program Exiting, Good Bye!")


#You have reached the end of the program
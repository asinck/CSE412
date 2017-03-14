#!/usr/bin/env python
import MySQLdb



go = ""
connection = False
db = None
cur = None
username = raw_input("Enter database username. ")
print "\nEnter database password."
password = raw_input("Note that password will not be hidden. ")

while not connection and go != "n":
    try:
        db = MySQLdb.connect(host = "localhost",    # your host, usually localhost
                             user = username,       # your username
                             passwd = password,     # your password
                             db = "CSE412")         # name of the database
        cur = db.cursor()
        db.autocommit(True)
        connection = True
        
    except:
        print "Error: could not connect to database."
        go = raw_input("Try again? (y/n) ")

    
while go != "n":
    table = raw_input("What table would you like to operate on?  ")

    print "What operation should be done?"
    print "1. Insert"
    print "2. Update"
    operation = raw_input("1 or 2?  ")

    while operation not in ['1', '2']:
        operation = raw_input("Enter 1 or 2.  ")



    if (operation == '1'):
        valueString = raw_input("What values? Enter a comma-separated list.  ")
        values = [i.strip() for i in valueString.split(",")]
        valueSetString = "'" + "', '".join(values) + "'"
        print valueSetString
        command = "INSERT INTO {} VALUES ({});".format(table, valueSetString)
        cur.execute(command)

    else:
        conditions = raw_input("Any conditions you'd like to use?  ")

        print "What fields would you like to update? Enter data in the following format: "
        print "columnName1, value"
        print "with one value on each line. Enter 0 when you're done."
        updates = []
        update = raw_input("> ")
        while update != "0":
            col, val = [i.strip() for i in update.split(",")]
            updates.append("{}='{}'".format(col, val))
            update = raw_input("> ")

        command = "UPDATE {} SET {} WHERE {};".format(table, ",".join(updates), conditions)
        cur.execute(command)



    go = raw_input("Perform another operation? (y/n)  ")

if (db != None):
    db.close()

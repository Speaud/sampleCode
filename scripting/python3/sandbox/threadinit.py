#!/usr/bin/python3
# Python program to illustrate the concept 
# of threading 
# concurrent access of threads to the shared variable cause race condition
# however if the shared variable is static you should be good...?
import os 
import time
import threading

"""

    "aws s3 ls s3://bucket | grep -cE '/[z]+/'"

        subprocess.run(bash_cmd.split())

    subprocess.run(bash_cmd.join())

    sp = subprocess.Popen(ls_cmd_to_run, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = sp.communicate()
"""

print("asd")
  
def task1(_p): 
    #time.sleep( 5 )
    print('_p=', _p)
    print("Task{} 1 assigned to thread: {}".format(_p, threading.current_thread().name))
    print("ID of process running task 1: {}".format(os.getpid())) 
  
def task2(): 
    print("Task 2 assigned to thread: {}".format(threading.current_thread().name)) 
    print("ID of process running task 2: {}".format(os.getpid())) 
  
if __name__ == "__main__": 
  
    # print ID of current process 
    print("ID of process running main program: {}".format(os.getpid())) 
  
    # print name of main thread 
    print("Main thread name: {}".format(threading.main_thread().name))
  
    # creating threads 
    t1 = threading.Thread(target=task1, name='t1', args=("asd",)) 
    t2 = threading.Thread(target=task2, name='t2')   
  
    # starting threads 
    t1.start() 
    t2.start() 
  
    # wait until all threads finish 
    t1.join() 
    t2.join() 

Assignment 5
------------

_Port of Java's java.util.Timer_

### java.util.Timer
The Java Timer class is a utility for scheduling execution of
methods at a certain time, with a certain delay or periodically, in a
background thread.

Java uses the Object.wait(long) method for scheduling the tasks. A
method which holds the thread til the time has run out or another
thread invokes the _notify()_ or _notifyAll()_ method for this object.
My thoughts are then that if the thread if 'hogged' when another
TimerTask is set to excecute, it would get unintentionally delayed.
This is a challenge I will look into in the implementation.
Also how to keep track when periodical or excact execution, whithout
that itself hogging the thread.

The class has methods as e.g.:
* cancel() - A method I don't think I'll look to much into porting,
  thanks to ARC
* schedule(TimerTask, Date) - For execution on a specific time.
* schedule(TimerTask, Date, period) - For execution on a specific time
  with preceeding periodical executions.
* schedule(TimerTask, delay) - For execution with delay.
* schedule(TimerTask, delay, period) - For execution with delay and
  with preceeding periodical executions.d

I will try to implement as many as I can, but probably won't be all.

### java.util.TimerTask

A task that can be scheduled for execution by a Timer.

The class extends Runnable, which gives it the _run()_ function, and
two of its own; _cancel()_ and _scheduledExecutionTime()_.
The first two simply runs and stops the task. All in all, a fairly
simple class to implement.


Implementation
==============

__Timer class__
Private properties:
* dispatch_queue_t queue - The Timer's thread
* NSMutableArray *tmpQueues - Temporary queues for repeating
  excecuting tasks.
* BOOL isSuspended - Boolean indicating if the Timer is suspended.

Private methods:
* whileTask:withPeriod: - A while loop checking for repeating
  execution of repeating tasks.

Public methods:
* scheduleTask:withDelay: - Fires task after spesified delay.
* scheduleTask:withDelay:andPeriod: - Fires delayed task with repeated
  execution.
* cancel - Suspends the Timer's and temporary threads.
* resume - Resumes the Timer's and temporary threads.

__scheduleTask:WithDelay:__
C has the method 'sleep(int)', which run in a thread, hogs it til the
sleep-timer is out. This is not so good if it delays other tasks from
executing on time. Therefor I have taken advantage of of the Grand
Central Dispatch's (GCD) 'dispatch_after(dispatch_time_t, ..)'.

__scheduleTask:WithDelay:andPeriod:__
For methods executing periodically I have chosen to have a loop
checking for periodical/exact executions, in a separate thread. Else,
nothing would come through in the Timer's thread. Those temporary queues are added to a class array, so they can be suspended and resumed.

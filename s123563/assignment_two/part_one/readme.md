Notes on part one
-----------------
I am using explicitly defined ivars when synthesizing, to allow direct assignment specially in initializors. This is because it is not completely safe to access getter/setter methods before an object is fully created (i.e. before the initializor has exited).

When a constraint is not met, the procedure will fail silently. Not sure if that's cool...

I use immutable sets on public interfaces to prohibit incorrect assignments/modifications, but overwrite privately with readwrite to get a generated setter. Therefore I've also implemented add/remove methods for sets (children/parents) that make temporary mutable copies for editing.

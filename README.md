# Ghost Event Center

The objective of this project is to create a separate event center from the GDC, not try to emulate it, not try to fake it, or whatever. It's really to be something _independent_.
      
**What's the need for this then?**

At the time of writing, the use of GDC for custom notifications isn't even possible. Plus, passing values/properties in notifications (using maybe userData dictionaries) is far from intuitive. Ghost notifications promote strong typing so it becomes more evident what to expect from custom notifications.
     
**So is this like an event bus? Why should I use this instead of *insert lib name* event bus?**

It is not an event bus. Well, it is similar, but not the same thing. An event bus requires you to hard connect with the event itself. Delete the event, and there you go refactorying, or your app breaks. In a notification center, you just set a listener, and let it waiting. If later you never even create that notification at run time, nothing fails (well, you can always delete the notification class and then it will break at buid time).

**I don't like it.**

It's ok, no hard feelings. Don't feel forced to use it.

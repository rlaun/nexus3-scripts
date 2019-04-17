
It is possible to create hosted raw repositories with an empty "name" property when using the scripting API.
This is not possible via web UI - a name is mandatory.

The resulting repository can not be deleted.

See <code>create-nameless-repository.sh</code> how to recreate this.

On the web UI, as name "NX.coreui.model.Repository-1" is displayed, with the URL "http://localhost:8081/repository//"
  
The REST API returns:

    "name" : "",
    "format" : "raw",
    "type" : "hosted",
    "url" : "http://localhost:8081/repository/"


Deletion via UI fails with the message:

     "Cannot get property 'format' on null object"

---

Of course sloppy Groovy scripting is the main reason, but maybe Nexus should catch this error and/or allow recovery (i.e. deleting)

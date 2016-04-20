## (Your) Data as a Service : The Easy Way to Build an API for Your Data

Got data?  Sure you do.  But, Is it useful?  How about that documentation and, oh yeah, sample use scenarios?

While "useful" is a relative term, your FTP server doesn't need another undocumented CSV in it, and we already know the "download" metrics for that file aren't really telling us the truth ... the same IP keeps downloading _every_ file from 1am-4am _everyday_.

Why not wrap an API around your data and exposure something really useful?  Not only will you gain a great deal of flexibility in what you expose, you can continue to improve what you expose, understand how it is being used and provide documentation and even an online test harness for end users.  They can learn about how your API works, what the return data looks like and what the real value of what you have to offer might be.  All the while, if you need to work on adding data, enhancing performance or adapting to format changes, the end user has continuous access to your data API while you work.

**Sound like a lot of work?**

Well it isn't ... in less than an hour we'll go through the steps of building a real (RESTish) API around a dataset to turn your imaginary users into real ones.  Using the [OpenAPI specification](https://openapis.org), Python and a super-useful Python package called [Connexion](https://github.com/zalando/connexion), we'll work our way toward a fully functional API with documentation and a test harness.  

**Sound impossible in less than an hour?**

Find out how it can be done!

## Resources


| Resource |    Notes        |
|------|-----------------|
| [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification)     | Check out the full documentation of the spec. |
| [Connexion](https://github.com/zalando/connexion) | Core repo for the Connexion framework build on top of [Flask](http://flask.pocoo.org/). |
| [Connexion Example Service](https://github.com/hjacobs/connexion-example)| Example that inspired this talk. |

### Example Specs

[Connexion Pet Store Example](https://github.com/hjacobs/connexion-example/blob/master/swagger.yaml)

## Prerequisites for this demo

Connexion
XLRD (to read XLS files)

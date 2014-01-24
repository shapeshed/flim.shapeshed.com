{
  "layout": "post",
  "title": "Thoughts on npm Inc.",
  "date": "Thu Jan 16 2014 08:37:17 GMT+0000 (GMT)",
  "description": "A new company npm Inc. is to be created to scale and maintain npm. This is great news for the community.",
  "tags": [
    "Opinion"
  ]
}

## npm - Core Infrastrture

As Node.js developers npm is a daily requirement. Whether we are writing client side code and leaning on build tools like grunt or building server-side applications we rely on npm. We need to know that `npm install` will work wherever we are. npm is also critical for deployments with many organisations using Continuous Integration and Continuous Deployment. If npm is unvailable or they don't have a local mirror they simply can't deploy.

In essense npm is the most important piece of infrastucture in the Node.js community. We rely on it for Node.js to be a viable development platform. This even more important with Node's approach of having a small core and a big userland. If you get beyond writing trivial apps you can expect to have to run `npm install`

## Growing pains

As Node.js has grown in popularity there have been scaling issues. This is not really surprising given the exponential growth in the number of modules. The #scalenpm project raised $ for Nodejitsu to continue to deliver the service. This seemed problematic to me and a less than ideal if only a short-term solution. It would be good to see some transp

## Being credible to Enterprise

For businesses that are putting their chips on Node.js the reliability of npm is a big issue. If you can't deploy something or your developers can't work you lose money. For Node.js to continue to drive into Enterprise technologies like Java and .NET a reliable and resiliant npm service is critical.

## npm Inc - a for profit

@isz announced that he is moving aside as the Benevolent dictator of Node.jsto start a new company npm Inc. This will be a for profit business that will exist to deliver the npm service and to provide services around npm. For me this is an excellent move. Some of the services I can see clients I work with buying include

* Provision of local mirrors
* Provision and maintenance of private npm instances
* Signed packages
* Guaranteed uptime and support

There is a clear commercial model that relies on the Open Source to survive and I'm sure there will be no shortage of Venture Capitalists queueing up to pump money in. I don't subscribe to Open Source Software rather than Free Software so I don't have any issue with npm being maintained by a commercial business. Developers have got to eat and it puts npm on a good footing. 

The task is not inconsiderable though. For me the entire architecture needs reconsidering. I'd like to see npm move towards a more distributed architecture, to maintain a commitment to being Open Source and consider approaches to signing packages or at least adding some hash checking. 

@isz has been an excellent leader of Node.js. His commitment to keeping the Node.js core small has really impressed me and he's led on community issues like gender equality and trolling admirably. In terms of an end of term report I still don't really get the whole he/she commit issue but I suspect larger issues with Joyent / StrongLoop were at play here.

## Conclusion

npm Inc is a great step forward for the community and another important milestone in the rapid growth of Node.js. With more and more enterprises adoption Node.js the community needs a reliable and scalable npm. The creation of npm Inc and the full-time attention of the creator of npm gives me confidence that core infrastructure for the platform will be delivered. 

 [1]: http://www.andybudd.com/
 [2]: http://www.amazon.com/CSS-Mastery-Advanced-Standards-Solutions/dp/1590596145
 [3]: http://blogs.msdn.com/ie/archive/2005/10/12/480242.aspx
 [4]: http://msdn.microsoft.com/workshop/author/dhtml/overview/ccomment_ovw.asp
 [5]: http://tredosoft.com/Multiple_IE
 [6]: http://www.w3.org/TR/REC-CSS1
 [7]: http://www.w3.org/TR/REC-CSS2/
 [8]: http://www.w3.org/TR/CSS21/

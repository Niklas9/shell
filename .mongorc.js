DBQuery.prototype._prettyShell = true;  // default to always use pretty print

// set prompt to contain servername
var PROMPT_SEP = '> ';
var HOST_SEP = '.';
var AT_SIGN = '@';
var getFirstSubdomainOfHost = function() {
    var host = db.serverStatus().host;
    if (host.indexOf(HOST_SEP) > 0)   return host;
    return host.split(HOST_SEP)[0];
};
var prompt = function() {
    return db + AT_SIGN + getFirstSubdomainOfHost() + PROMPT_SEP;
};

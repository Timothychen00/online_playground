from functools import wraps
import datetime
import time

from flask import flash, redirect,session

def login_required(a):
    @wraps(a)
    def wrap(*args,**kwargs):
        if 'logged_in' in session and session['logged_in']:
            return a(*args,**kwargs)
        else:
            flash('請先登入')
            return redirect('/login')
    return wrap

def timing(f):
    @wraps(f)
    def wrap(*args, **kw):
        ts = time.time()
        result = f(*args, **kw)
        te = time.time()
        print('func:%r args:[%r, %r] took: %2.8f sec' % \
          (f.__name__, args, kw, te-ts))
        return result
    return wrap
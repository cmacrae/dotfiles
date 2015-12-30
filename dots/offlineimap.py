#! /usr/bin/env python
import getpass, re, subprocess
from os.path import expanduser, join
def get_keychain_pass(account=None, server=None):
    params = {
        'security': '/usr/bin/security',
        'command': 'find-internet-password',
        'user': getpass.getuser(),
        'account': account,
        'server': server,
        'keychain': join(expanduser('~'), 'Library/Keychains/login.keychain'),
    }
    command = "sudo -u %(user)s %(security)s -v %(command)s -g -a %(account)s -s %(server)s %(keychain)s" % params
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    outtext = [l for l in output.splitlines()
               if l.startswith('password: ')][0]

    return re.match(r'password: "(.*)"', outtext).group(1)

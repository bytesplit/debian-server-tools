# Test email addresses

- Invalid address: Gmail's policy (letters, numers, periods), [RFC 5322](http://emailregex.com/), Plus dash `-`
- Misspelling https://github.com/mailcheck/mailcheck and see /mail/mx-check/gmail-typo.grep
- Disposable domain, see /mail/mx-check/
- Disposable MX, see /mail/mx-check/disposable-mx.list
- Banned user part in address, see /mail/mx-check/banned-addresses.grep
- Custom domain and address blacklist
- Already registered?
- Domain exists in whois
- Domain has MX (or A) record
- MX connection test: SMTP banner
- Mailbox test: `RCPT TO:<user@example.com>`

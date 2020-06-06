class Banner:
    def __init__(self, message):
        self._message = message


    def __str__(self):
        print('\n'.join([self._horizontal_rule(), self._empty_line(), self._message_line(), self._empty_line(), self._horizontal_rule()]))


    def _horizontal_rule(self):
        return '+' + '-' * (len(self.message) + 2) + '+'

    def _empty_line(self):
        return '|' + ' ' * (len(self.message) + 2) + '|'

    def _message_line(self):
        return '| ' + self.message + ' |'

    @property
    def message(self):
        return self._message


banner = Banner('To boldly go where no one has gone before.')
print(banner)




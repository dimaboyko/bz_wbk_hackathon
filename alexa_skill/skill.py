from flask import Flask,render_template
from flask_ask import Ask, statement, question, session
import requests

app = Flask(__name__)
ask  = Ask(app,'/')

@ask.launch
def start_skill():
    return question(render_template('welcome'))

@ask.intent('WannaPayIntent')
def wanna_pay_intent():
    #create contract
    r = requests.get('http://google.com')
    return question(render_template('contract_created'))

@ask.intent('SplitIntent')
def split_intent():
    list_or_users = {"Jack": False, "Karola": False, "Marchin": False, "Radek": False}
    session.attributes['list_or_users'] = list_or_users
    first_user = session.attributes['user'] = list(list_or_users)[0]
    return question(render_template('split_the_bill', first_user = first_user))

@ask.intent('ProvideProductIntent',mapping={'product': 'Product'})
def product_statement(product):
    try:
        user = session.attributes['user']
        session.attributes['list_or_users'][user] = product
        del session.attributes['user']
        # send request with {user: product}
        r = requests.get('http://google.com')
        a = session.attributes['list_or_users']
        next_user = list({k: v for k, v in a.items() if v == False})[0]
        if next_user:
            session.attributes['user'] = next_user
            return question(render_template('next_user_question', next_user = next_user))
    except IndexError as e:
        return question(render_template('is_that_it'))

@ask.intent('ConfirmIntent')
def confirm_intent():
    # ping 4 phones for notifications
    r = requests.get('http://google.com')
    return statement(render_template('as_soos_as_approved'))

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')

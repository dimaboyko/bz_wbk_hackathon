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
    headers = {'X-Api-Key': 'brobill'}
        #curl -H "X-Api-Key: mochila" https://bz-wbk-hackathon.herokuapp.com/api/v1/status.json
    r = requests.post('https://bz-wbk-hackathon.herokuapp.com/api/v1/create_contract.json', headers = headers)

    return question(render_template('contract_created'))

@ask.intent('SplitIntent')
def split_intent():
    headers = {'X-Api-Key': 'brobill'}
    r = requests.post('https://bz-wbk-hackathon.herokuapp.com/api/v1/split_the_bill.json', headers = headers)

    list_or_users = {"Jack": False, "Marchin": False, "Radek": False}
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
        headers = {'X-Api-Key': 'brobill'}
        payload = {'client': user, 'item': product}
        r = requests.post('https://bz-wbk-hackathon.herokuapp.com/api/v1/match_product.json', headers = headers,data = payload)
        a = session.attributes['list_or_users']
        next_user = list({k: v for k, v in a.items() if v == False})[0]
        if next_user:
            session.attributes['user'] = next_user
            return question(render_template('next_user_question', next_user = next_user))
    except IndexError as e:
        return question(render_template('is_that_it'))

@ask.intent('ConfirmIntent')
def confirm_intent():
    headers = {'X-Api-Key': 'brobill'}
    r = requests.post('https://bz-wbk-hackathon.herokuapp.com/api/v1/ping_phones.json', headers = headers)
    return statement(render_template('as_soos_as_approved'))

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')

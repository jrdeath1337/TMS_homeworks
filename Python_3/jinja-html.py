from jinja2 import Environment, FileSystemLoader

person = [
        {"name": "Dima", "mail": "dima@mail.com"},
        {"name": "Vova", "mail": "vova@mail.com"},
        {"name": "Natasha", "mail": "Tasha@mail.com"},
        {"name": "Lena", "mail": "Lena@mail.com"},
        {"name": "Vika", "mail": "Vika@mail.com"},
        {"name": "Ira", "mail": "Ira@mail.com"}
        ]
env = Environment(loader=FileSystemLoader('test_template'))
template = env.get_template('template.html')
output = template.render(users=person)
with open('site_for_person.html', 'w', encoding='utf-8') as f:
    f.write(output)

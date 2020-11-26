import psycopg2 as ps

def execute_query(query):

    conn = ps.connect(
        host = 'zepalheta-postgres',
        database = 'zepalheta',
        user = 'postgres',
        password = 'qaninja'

    )

    cur = conn.cursor()

    cur.execute(query)

    conn.commit()

    cur.close()
    conn.close()

def format_cpf(cpf):

    return cpf[:3] + "." + cpf[3:6] + "." + cpf[6:9] + "-" + cpf[9:]

def insert_customer(name,cpf,address,phone):

    formatted_cpf = format_cpf(cpf)

    query = "insert into public.customers(name,cpf,address,phone_number) values ('{}','{}','{}','{}')".format(name,formatted_cpf,address,phone)


    execute_query(query)
    

def remove_customer_by_cpf(cpf):

    formatted_cpf = format_cpf(cpf)

    query = "delete from public.customers where cpf = '{}';".format(formatted_cpf)
    
    execute_query(query)
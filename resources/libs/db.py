import psycopg2 as ps

def remove_customer_by_cpf(cpf):

    formatted_cpf = cpf[:3] + "." + cpf[3:6] + "." + cpf[6:9] + "-" + cpf[9:]

    conn = ps.connect(
        host = 'zepalheta-postgres',
        database = 'zepalheta',
        user = 'postgres',
        password = 'qaninja'

    )

    cur = conn.cursor()

    cur.execute("delete from public.customers where cpf = '{}';".format(formatted_cpf))

    conn.commit()

    cur.close()
    conn.close()
Majortype

    1. Number
        <!-- Anything need to store at number field without decimal -->
        * smallint
        * integer
        * bigint

        <!-- Auto increment - Id usage -->
        * smallserial 
        * serial
        * bigserial

        <!-- Use for acculate precision (money, currency, financial, scientific calculation) -->
        * decimal
        * numeric
        
        <!-- Use for approximate precision (engineering, physics measurement, product weight, size, etc.) -->
        * real
        * double precision
        * float

    2. Character
        * varchar(n)
        * char(n)
        * text

    3. Boolean
        * true, t, yes, 1, y
        * false, f, no, 0, n

    4. Date/Time
        * date

        * time
        * time without time zone
            '12:00:00'::time without time zone
        * time with time zone
            '12:00:00+10'::time with time zone

        * timestamp
            '2022-01-01 12:00:00'::timestamp
        * timestamp without timezone
            '2022-01-01 12:00:00'::timestamp without timezone
        * timestamp with timezone
            '2022-01-01 12:00:00+10'::timestamp with timezone

        * interval (like duration of time)
            '1W 1 D 2 H 3 M 4 S'::INTERVAL

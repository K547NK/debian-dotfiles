import datetime as dt
import matplotlib.pyplot as plt
from matplotlib import style
import pandas as pd
import pandas_datareader.data as web

style.use('ggplot')
start = dt.datetime(2005,1,1)
end = dt.datetime(2019,12,31)

df = web.DataReader('AUDUSD=X', 'yahoo', start ,end)

print(df.tail(10))
df.to_csv('AUDUSD=X.csv')


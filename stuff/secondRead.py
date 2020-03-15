import datetime as dt
import matplotlib.pyplot as plt
from matplotlib import style
import mplfinance
from mplfinance import candlestick_ohlc
import matplotlib.dates as mdates
import pandas as pd
import pandas_datareader.data as web
from pandas.util.testing import assert_frame_equal

style.use('ggplot')

df = pd.read_csv('AUDUSD=X.csv',parse_dates = True, index_col=0)
#df['100ma'] = df['Adj Close'].rolling(window=100, min_periods=0).mean()

#df.dropna(inplace = True)
#print(df.head())

#plotting in matplotlib

df_ohlc = df['Adj Close'].resample('1D').ohlc()
df_volume = df['Volume'].resample('1D').sum()
#print(df_ohlc.head())
df_ohlc.reset.index(inplace=True)


ax1 = plt.subplot2grid((6,1), (0,0), rowspan=5, colspan=1)
ax2 = plt.subplot2grid((6,1), (5,0), rowspan=5, colspan=1, sharex=ax1)

#ax1.plot(df.index, df['Adj Close'])
#ax1.plot(df.index, df['100ma'])
#ax2.bar(df.index, df['Volume'])

#plt.show()

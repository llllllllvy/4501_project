import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
 
data311 = pd.read_csv("E:/哥大msor/4501/Project/data311_final.csv")
datatree = pd.read_csv("E:/哥大msor/4501/Project/ftreedf_final.csv")
datarent = pd.read_csv("E:/哥大msor/4501/Project/zillowdf_final.csv")

data311_3 = data311[(data311.created_date>='2015-01-01T00:00:00.000')&(data311.created_date<'2023-10-01T00:00:00.000')]
data311_3 = data311_3['complaint_id'].groupby([data311_3.created_date.apply(lambda x:x[:7]),data311_3.zipcode]).count()
data311_3 = data311_3.reset_index().set_index('created_date')

month_range = data311_3.index.unique()
nm = len(month_range)

datatree_3 = datatree.tree_id.groupby(datatree.zipcode).count()
datatree_3.name = 'num_tree'

datarent_3 = datarent
datarent_3 = datarent_3.iloc[:,2:].groupby(datarent['zipcode']).mean()


df0 = [pd.merge(pd.merge(datatree_3,datarent_3.iloc[:,i],left_index=True,right_index=True,how='inner'),data311_3.loc[month_range[i]].set_index('zipcode'),left_index=True,right_index=True,how="inner") for i in range(nm)]



fig, (ax1, ax2) = plt.subplots(2, 1, sharex=True, figsize=(10, 8))
ln1 = ax1.scatter([], [], label='Rent', color='blue')
ax1_2 = ax1.twinx()
ln2 = ax1_2.scatter([], [], label='Number of Trees', color='green')
ln3 = ax2.scatter([], [], label='Rent', color='blue')
ax2_2 = ax2.twinx()
ln4 = ax2_2.scatter([], [], label='Number of Complaints', color='red')


ln = [ln1,ln2,ln3,ln4]

for ax in [ax1, ax2]:
    ax.set_ylim(1000, 5000)
    ax.set_xlim(10000, 11700)
    ax.grid()

ax1_2.set_ylim(0, 20000)
ax2_2.set_ylim(0, 5000)
ax1.set_ylabel('Rent')
ax1_2.set_ylabel('Number of Trees')
ax2.set_xlabel('Zip Code')
ax2.set_ylabel('Rent')
ax2_2.set_ylabel('Number of Complaints')



l1 = ax1.legend(loc='upper left')
l2 = ax1_2.legend(loc='upper right')
l3 = ax2.legend(loc='upper left')
l4 = ax2_2.legend(loc='upper right')
plt.tight_layout()

titles = [f"Monthly rent to number of trees and monthly complaints in {month_range[frame]}" for frame in range(len(month_range))]

def update(frame):
    data = {
        'zip_code': df0[frame].index,
        'rent': df0[frame].iloc[:,1],
        'num_trees': df0[frame].num_tree,
        'num_complaints': df0[frame].complaint_id,
    }
    df = pd.DataFrame(data)
    ln[0].set_offsets(list(zip(df['zip_code'], df['rent'])))
    ln[1].set_offsets(list(zip(df['zip_code'], df['num_trees'])))
    ln[2].set_offsets(list(zip(df['zip_code'], df['rent'])))
    ln[3].set_offsets(list(zip(df['zip_code'], df['num_complaints'])))
    ax1.set_title(titles[frame])
    return ln



ani = FuncAnimation(fig, update, frames=np.arange(nm), blit=True)

plt.show()
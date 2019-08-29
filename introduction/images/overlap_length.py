#!/usr/bin/env python3

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

plt.style.use("ggplot")

df = pd.read_table("length.csv", header=None)
df = df.rename(columns={0:"Overlap length"})

df.hist(bins=np.logspace(np.log10(df.min()),np.log10(df.max()), 60), cumulative=True, density=True, histtype='step')

plt.axvline(2000, linestyle="dashed", color="black", linewidth=0.5)

plt.xlabel("Overlap length")
plt.xscale("log")

plt.title("")

plt.savefig("tmp.pdf")
